import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/data/users/users.dart';

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
        super(StoreState.initial()) {
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
        _storeRepository.stream(storeId: store.id!).listen((store) {
      setStore(store);
    });
  }

  void setStore(StoreModel store) async {
    assert(store.id != null && store.id!.isNotEmpty);
    await _storeCacheService.save(store.id!);
    emit(state.copyWith(store: store));
  }

  void loadStoreForUser({required UserModel user}) async {
    if (user == UserModel.empty()) {
      emit(
        state.copyWith(
          status: StoreStatus.error,
          failure: Failure(message: 'User is null'),
        ),
      );
    }
    if (user.isAnonymous) {
      final failureOrStore =
          await _storeRepository.createEmptyStoreForUser(userId: user.id!);

      failureOrStore.fold(
        (failure) {
          emit(state.copyWith(
            status: StoreStatus.error,
            failure: failure,
          ));
        },
        (store) async {
          watchStore(store);
          emit(state.copyWith(
            status: StoreStatus.loaded,
            store: store,
          ));
        },
      );
    } else {
      final failureOrStore =
          await _storeRepository.getStoresForUser(userId: user.id!);

      failureOrStore.fold(
        (failure) => emit(state.copyWith(
          status: StoreStatus.error,
          failure: failure,
        )),
        (stores) async {
          watchStore(stores.first);
          emit(state.copyWith(
            status: StoreStatus.loaded,
            store: stores.first,
          ));
        },
      );
    }
  }
}
