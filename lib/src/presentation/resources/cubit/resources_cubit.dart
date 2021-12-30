import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/models/resources/i_resource_model.dart';
import 'package:meny/src/data/repositories/i_resources_repository.dart';

part 'resources_state.dart';

class ResourcesCubit<M extends IResourceModel> extends Cubit<ResourcesState> {
  final IResourcesRepository _iResourcesRepository;
  late StreamSubscription _indexSubscription;

  ResourcesCubit({
    required iResourcesRepository,
  })  : _iResourcesRepository = iResourcesRepository,
        super(ResourcesInitial()) {
    _indexSubscription = _iResourcesRepository.getAll().listen((resources) {
      emit(ResourcesLoaded(resources as List<IResourceModel>));
    })
      ..onError(
        (error) {
          emit(
            ResourcesFailure(
              Failure(message: 'Something went wrong'),
            ),
          );
        },
      );
  }

  @override
  Future<void> close() async {
    super.close();
    _indexSubscription.cancel();
  }

  factory ResourcesCubit.use() {
    switch (M) {
      case MenuEntity:
        return ResourcesCubit(
          iResourcesRepository: Locator.instance<MenuRepository>(),
        );
      case CategoryEntity:
        return ResourcesCubit(
          iResourcesRepository: Locator.instance<CategoryRepository>(),
        );
      case MenuItemEntity:
        return ResourcesCubit(
          iResourcesRepository: Locator.instance<MenuItemRepository>(),
        );
      default:
        throw Failure(message: 'You must provide a $M');
    }
  }
}
