import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'store_cubit.freezed.dart';
part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit({
    required AuthCubit authCubit,
    StoreRepository? storeRepository,
    StoreCacheService? storeCacheService,
  })  : _authCubit = authCubit,
        _storeRepository = storeRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(_Loading(store: StoreModel.empty())) {
    _authSubscription?.cancel();

    _authSubscription = _authCubit.stream.listen((state) {
      state.maybeWhen(
        authenticated: (user) {
          loadStoreForUser(user: user);
        },
        anonymous: (user) {
          loadStoreForUser(user: user);
        },
        unauthenticated: (user) {
          emit(_Loading(store: StoreModel.empty()));
        },
        orElse: () {},
      );
    });
  }

  final AuthCubit _authCubit;
  final StoreRepository _storeRepository;
  final StoreCacheService _storeCacheService;

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
            (failure) {
              return StoreState.error(
                store: state.store,
                exception: failure,
              );
            },
            (stores) {
              watchStore(stores.first);
              return StoreState.loaded(store: stores.first);
            },
          ),
        );
      }
    } catch (err) {
      developer.log('err ${err.runtimeType}');
      emit(
        StoreState.error(
          store: state.store,
          exception: const CustomException(message: 'Store is null'),
        ),
      );
    }
  }

  void update(StoreModel store) => emit(state.copyWith(store: store));
}
