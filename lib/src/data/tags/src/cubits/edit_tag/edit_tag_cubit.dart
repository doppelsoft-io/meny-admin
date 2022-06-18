import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/stores/cubits/cubits.dart';
import 'package:meny_admin/src/data/tags/tags.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_tag_state.dart';
part 'edit_tag_cubit.freezed.dart';

class EditTagCubit extends Cubit<EditTagState> {
  EditTagCubit({
    required StoreCubit storeCubit,
    TagRepository? tagRepository,
  })  : _storeCubit = storeCubit,
        _tagRepository = tagRepository ?? Locator.instance(),
        super(_Loading(tag: TagModel.empty()));

  final StoreCubit _storeCubit;
  final TagRepository _tagRepository;

  Future<void> loadItem(TagModel tag) async {
    if (tag.id != null && tag.id!.isNotEmpty) {
      /// Needed to trigger loaded event in listener
      await Future<void>.delayed(const Duration(milliseconds: 300));
      emit(_Loaded(tag: tag));
    } else {
      try {
        final storeId = _storeCubit.state.store.id!;
        final newItem = await _tagRepository.create(
          storeId: storeId,
          resource: tag.copyWith(createdAt: DateTime.now()),
        );
        emit(_Loaded(tag: newItem));
      } on CreateTagException catch (err) {
        emit(
          _Error(
            tag: tag,
            exception: err,
          ),
        );
      }
    }
  }

  Future<void> update(TagModel tag) async {
    emit(_Updating(tag: tag));

    try {
      final storeId = _storeCubit.state.store.id!;
      await _tagRepository.update(
        storeId: storeId,
        resource: tag.copyWith(updatedAt: DateTime.now()),
      );
      emit(_Success(tag: tag));
    } on UpdateTagException catch (err) {
      emit(
        _Error(
          tag: tag,
          exception: err,
        ),
      );
    }
  }
}
