import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({
    required AuthCubit authCubit,
    CategoryRepository? categoryRepository,
  })  : _authCubit = authCubit,
        _categoryRepository = categoryRepository ?? Locator.instance(),
        super(const _Loading());
  StreamSubscription? _subscription;

  final AuthCubit _authCubit;
  final CategoryRepository _categoryRepository;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> load({required String storeId}) async {
    _authCubit.state.maybeWhen(
      authenticated: (_) {
        _load(storeId: storeId);
      },
      anonymous: (_) {
        _load(storeId: storeId);
      },
      orElse: () {},
    );
  }

  Future<void> _load({required String storeId}) async {
    await _subscription?.cancel();
    _subscription = _categoryRepository
        .getAll(
      storeId: storeId,
    )
        .listen(
      (categories) {
        emit(_Loaded(categories: categories));
      },
    )..onError(
        (error) {
          log(error.toString());
          emit(
            _Error(
              categories: state.categories,
              exception: const CustomException(
                message: 'Failed to load categories',
              ),
            ),
          );
        },
      );
  }
}
