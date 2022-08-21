import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/domain/domain.dart';
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

  Future<void> load({
    required String storeId,
    OrderBy orderBy = const OrderBy('createdAt', sortColumnIndex: 1),
  }) async {
    emit(
      _Loading(
        categories: state.categories,
        orderBy: orderBy,
      ),
    );
    _authCubit.state.maybeWhen(
      initial: (_) {},
      unauthenticated: (_) {},
      orElse: () {
        _load(
          storeId: storeId,
          orderBy: orderBy,
        );
      },
    );
  }

  Future<void> _load({
    required String storeId,
    required OrderBy orderBy,
  }) async {
    await _subscription?.cancel();
    _subscription = _categoryRepository
        .getAll(
      storeId: storeId,
      orderBy: orderBy,
    )
        .listen(
      (categories) {
        emit(
          _Loaded(
            categories: categories,
            orderBy: state.orderBy,
          ),
        );
      },
    )..onError(
        (error) {
          log(error.toString());
          emit(
            _Error(
              categories: state.categories,
              orderBy: state.orderBy,
              exception: const CustomException(
                message: 'Failed to load categories',
              ),
            ),
          );
        },
      );
  }
}
