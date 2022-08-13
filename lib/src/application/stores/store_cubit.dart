import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'store_cubit.freezed.dart';
part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
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

  final StoreRepository _storeRepository;
  final StoreCacheService _storeCacheService;
  final FirebaseAuth _firebaseAuth;

  StreamSubscription? _authSubscription;
  StreamSubscription? _storeSubscription;

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    _storeSubscription?.cancel();
    return super.close();
  }

  void watchStore(StoreModel store) {
    _storeSubscription?.cancel();
    _storeSubscription =
        _storeRepository.stream(storeId: store.id!).listen(setStore)
          ..onError((error) {
            developer.log(error.toString());
          });
  }

  Future<void> setStore(StoreModel store) async {
    assert(store.id != null && store.id!.isNotEmpty, 'store.id is empty');
    developer.log('MEE: store ${store.id}');
    await _storeCacheService.save(store.id!);
    emit(state.copyWith(store: store));
  }

  Future<void> loadStoreForUser({required UserModel user}) async {
    try {
      if (user == UserModel.empty()) {
        emit(
          StoreState.error(
            store: state.store,
            exception: const CustomException(message: 'User is null'),
          ),
        );
      }
      if (user.isAnonymous) {
        final failureOrStore =
            await _storeRepository.createEmptyStoreForUser(userId: user.id!);

        emit(
          failureOrStore.fold(
            (failure) {
              return StoreState.error(
                store: state.store,
                exception: failure,
              );
            },
            (store) {
              watchStore(store);
              return StoreState.loaded(store: store);
            },
          ),
        );
      } else {
        final failureOrStore =
            await _storeRepository.getStoresForUser(userId: user.id!);

        emit(
          failureOrStore.fold(
            (failure) => StoreState.error(
              store: state.store,
              exception: failure,
            ),
            (stores) {
              watchStore(stores.first);
              return StoreState.loaded(store: stores.first);
            },
          ),
        );
      }
    } catch (err) {
      developer.log('err $err');
    }
  }

  void update(StoreModel store) => emit(state.copyWith(store: store));
}
