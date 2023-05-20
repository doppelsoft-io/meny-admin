import 'dart:async';
import 'dart:developer' as developer;

import 'package:doppelsoft_core/doppelsoft_core.dart';
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
  })  : _authCubit = authCubit,
        _storeRepository = storeRepository ?? Locator.instance(),
        super(_Loading(store: StoreModel.empty())) {
    _authSubscription?.cancel();
    _getUser().then(loadStoreForUser);
  }

  Future<UserModel> _getUser() {
    final completer = Completer<UserModel>();

    _authCubit.state.maybeWhen(
      /// If already loaded, use User
      authenticated: (user) {
        _authSubscription?.cancel();
        completer.complete(user);
      },
      orElse: () {
        /// Otherwise, listen to stream and wait for loaded state
        _authSubscription?.cancel();
        _authSubscription = _authCubit.stream.listen((state) {
          state.maybeWhen(
            authenticated: (user) {
              _authSubscription?.cancel();
              completer.complete(user);
            },
            orElse: () => completer.completeError('Failed to retrieve User'),
          );
        });
      },
    );

    return completer.future;
  }

  final AuthCubit _authCubit;
  final StoreRepository _storeRepository;

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
    emit(state.copyWith(store: store));
  }

  Future<void> loadStoreForUser(UserModel user) async {
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
        try {
          final store =
              await _storeRepository.createEmptyStoreForUser(userId: user.id!);
          watchStore(store);
          emit(StoreState.loaded(store: store));
        } on CustomException catch (err) {
          emit(
            StoreState.error(
              store: state.store,
              exception: err,
            ),
          );
        }
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
