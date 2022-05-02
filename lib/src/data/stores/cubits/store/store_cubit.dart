import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/data/users/users.dart';

part 'store_cubit.freezed.dart';
part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final StoreRepository _storeRepository;
  final StoreCacheService _storeCacheService;
  final FirebaseAuth _firebaseAuth;

  StreamSubscription? _authSubscription;
  StreamSubscription? _storeSubscription;

  StoreCubit({
    StoreRepository? storeRepository,
    StoreCacheService? storeCacheService,
    FirebaseAuth? firebaseAuth,
  })  : _storeRepository = storeRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        _firebaseAuth = firebaseAuth ?? Locator.instance(),
        super(StoreState.loading(store: StoreModel.empty())) {
    _authSubscription?.cancel();

    _authSubscription = _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        loadStoreForUser(user: UserModel.fromFirebaseAuthUser(user));
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    _storeSubscription?.cancel();
    return super.close();
  }

  void watchStore(StoreModel store) {
    _storeSubscription?.cancel();
    _storeSubscription =
        _storeRepository.stream(storeId: store.id!).listen(setStore);
  }

  void setStore(StoreModel store) async {
    assert(store.id != null && store.id!.isNotEmpty);
    await _storeCacheService.save(store.id!);
    emit(state.copyWith(store: store));
  }

  void loadStoreForUser({required UserModel user}) async {
    if (user == UserModel.empty()) {
      emit(
        StoreState.error(
          store: state.store,
          exception: const Failure(message: 'User is null'),
        ),
      );
    }
    if (user.isAnonymous) {
      final failureOrStore =
          await _storeRepository.createEmptyStoreForUser(userId: user.id!);

      emit(failureOrStore.fold(
        (failure) => StoreState.error(
          store: state.store,
          exception: failure,
        ),
        (store) {
          watchStore(store);
          return StoreState.loaded(store: store);
        },
      ),);
    } else {
      final failureOrStore =
          await _storeRepository.getStoresForUser(userId: user.id!);

      emit(failureOrStore.fold(
        (failure) => StoreState.error(
          store: state.store,
          exception: failure,
        ),
        (stores) {
          watchStore(stores.first);
          return StoreState.loaded(store: stores.first);
        },
      ),);
    }
  }
}
