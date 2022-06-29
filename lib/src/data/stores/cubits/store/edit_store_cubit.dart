import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_store_state.dart';
part 'edit_store_cubit.freezed.dart';

class EditStoreCubit extends Cubit<EditStoreState> {
  EditStoreCubit({
    required StoreCubit storeCubit,
    StoreRepository? storeRepository,
  })  : _storeCubit = storeCubit,
        _storeRepository = storeRepository ?? Locator.instance(),
        super(_Initial(store: StoreModel.empty()));

  final StoreCubit _storeCubit;
  final StoreRepository _storeRepository;

  void update(StoreModel store) => emit(state.copyWith(store: store));

  Future<void> save() async {
    try {
      emit(_Saving(store: state.store));

      await _storeRepository.update(store: state.store);

      _storeCubit.update(state.store);

      emit(_Success(store: state.store));
    } on CustomException catch (err) {
      emit(
        _Error(
          store: state.store,
          exception: err,
        ),
      );
    } finally {
      emit(_Initial(store: state.store));
    }
  }
}
