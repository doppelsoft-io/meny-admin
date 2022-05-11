import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/repositories/i_resources_repository.dart';

part 'resources_state.dart';

class ResourcesCubit<M> extends Cubit<ResourcesState> {
  ResourcesCubit({
    required IResourcesRepository iResourcesRepository,
  })  : _iResourcesRepository = iResourcesRepository,
        super(ResourcesInitial());

  final IResourcesRepository _iResourcesRepository;
  late StreamSubscription _indexSubscription;

  void load({required String storeId}) {
    _indexSubscription =
        _iResourcesRepository.getAll(storeId: storeId).listen((resources) {
      emit(ResourcesLoaded(resources as List<M>));
    })
          ..onError(
            (error) {
              emit(
                const ResourcesFailure(
                  Failure(message: 'Something went wrong'),
                ),
              );
            },
          );
  }

  @override
  Future<void> close() async {
    await _indexSubscription.cancel();
    await super.close();
  }

  factory ResourcesCubit.use() {
    switch (M) {
      case MenuModel:
        return ResourcesCubit(
          iResourcesRepository: Locator.instance<MenuRepository>(),
        );
      case CategoryModel:
        return ResourcesCubit(
          iResourcesRepository: Locator.instance<CategoryRepository>(),
        );
      case MenuItemModel:
        return ResourcesCubit(
          iResourcesRepository: Locator.instance<MenuItemRepository>(),
        );
      default:
        throw Failure(message: 'You must provide a $M');
    }
  }
}
