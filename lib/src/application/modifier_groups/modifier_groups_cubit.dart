import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'modifier_groups_state.dart';
part 'modifier_groups_cubit.freezed.dart';

class ModifierGroupsCubit extends Cubit<ModifierGroupsState> {
  ModifierGroupsCubit({
    required AuthCubit authCubit,
    ModifierGroupRepository? modifierGroupRepository,
  })  : _authCubit = authCubit,
        _modifierGroupRepository =
            modifierGroupRepository ?? Locator.instance(),
        super(const ModifierGroupsState.loading());

  final AuthCubit _authCubit;
  final ModifierGroupRepository _modifierGroupRepository;

  StreamSubscription? _subscription;

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
        groups: state.groups,
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
    _subscription = _modifierGroupRepository
        .getAll(
      storeId: storeId,
      orderBy: orderBy,
    )
        .listen(
      (groups) {
        emit(
          _Loaded(
            groups: groups,
            orderBy: state.orderBy,
          ),
        );
      },
    )..onError(
        (error) {
          log(error.toString());
          emit(
            ModifierGroupsState.error(
              groups: state.groups,
              orderBy: state.orderBy,
              exception: const CustomException(
                message: 'Failed to load modifier groups',
              ),
            ),
          );
        },
      );
  }
}
