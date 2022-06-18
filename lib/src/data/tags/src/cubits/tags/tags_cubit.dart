import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/tags/tags.dart';
import 'package:meny_core/meny_core.dart';

part 'tags_state.dart';
part 'tags_cubit.freezed.dart';

class TagsCubit extends Cubit<TagsState> {
  TagsCubit({
    TagRepository? tagRepository,
  })  : _tagRepository = tagRepository ?? Locator.instance(),
        super(const _Loading());

  final TagRepository _tagRepository;

  StreamSubscription? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> load({required String storeId}) async {
    await _subscription?.cancel();
    _subscription = _tagRepository
        .getAll(
      storeId: storeId,
    )
        .listen((tags) {
      emit(_Loaded(tags: tags));
    })
      ..onError(
        (error) {
          emit(
            _Error(
              tags: state.tags,
              exception: const CustomException(
                message: 'Failed to load tags',
              ),
            ),
          );
        },
      );
  }
}
