import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/stores/services/services.dart';
import 'package:meny/src/extensions/extensions.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/presentation/sheet_args.dart';
import 'package:meny/src/services/services.dart';
import 'package:meny/src/utils/utils.dart';

class UpdateMenuItemSheet extends HookWidget {
  static const String routeName = '/updateMenuItem';

  static Route route(SheetArgs args) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EditMenuItemCubit>(
              create: (context) => EditMenuItemCubit()
                ..loadItem(args.resource as MenuItemEntity),
            ),
            BlocProvider<DeleteMenuItemCubit>(
              create: (context) => DeleteMenuItemCubit(),
            ),
          ],
          child: BlocBuilder<EditMenuItemCubit, EditMenuItemState>(
            builder: (context, state) {
              if (state.item != null) {
                final item = state.item!;
                return BlocProvider<MenuItemCategoriesCubit>(
                  create: (context) =>
                      MenuItemCategoriesCubit(menuItem: item)..load(),
                  child: UpdateMenuItemSheet(resource: item),
                );
              } else {
                if (state.failure != null) {
                  return Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: true,
                    ),
                    body: ErrorDisplay(failure: state.failure!),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
            },
          ),
        );
      },
    );
  }

  final MenuItemEntity resource;

  const UpdateMenuItemSheet({
    Key? key,
    required this.resource,
  }) : super(key: key);

  static open({
    required BuildContext context,
    required MenuItemEntity resource,
  }) {
    return Navigator.of(context).pushNamed(
      UpdateMenuItemSheet.routeName,
      arguments: SheetArgs(resource: resource),
    );
  }

  Future<bool> _onWillPop({
    required BuildContext context,
    required List<CategoryEntity> categories,
  }) {
    if (resource.name.isEmpty) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Close without saving?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('YES'),
              ),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('NO'),
              ),
            ],
          );
        },
      ).then((value) {
        if (value) {
          context.read<DeleteMenuItemCubit>().delete(
                item: resource,
                categories: categories,
              );
          return Future.value(false);
        }
        return Future.value(value);
      });
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(text: resource.name);
    final descriptionController =
        useTextEditingController(text: resource.description);
    final priceController = useTextEditingController(
      text: resource.price.toString(),
    );

    return BlocBuilder<MenuItemCategoriesCubit, MenuItemCategoriesState>(
      builder: (context, menuItemCategoriesState) {
        return WillPopScope(
          onWillPop: () => _onWillPop(
            context: context,
            categories: menuItemCategoriesState.categories,
          ),
          child: BlocConsumer<EditMenuItemCubit, EditMenuItemState>(
            listener: (context, editMenuItemState) {
              if (editMenuItemState.isSuccess) {
                ToastService.showNotification(const Text('Item updated'));
                Navigator.pop(context);
              }
              if (editMenuItemState.isError) {
                DialogService.showErrorDialog(
                  context: context,
                  failure: editMenuItemState.failure!,
                );
              }
            },
            builder: (context, editMenuItemState) {
              return BlocBuilder<DeleteMenuItemCubit, DeleteMenuItemState>(
                builder: (context, deleteMenuItemState) {
                  return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      automaticallyImplyLeading: true,
                      iconTheme: const IconThemeData(color: Colors.black),
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Edit Menu Item',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(8.0),
                        child: Visibility(
                          visible: editMenuItemState.isUpdating ||
                              deleteMenuItemState.isDeleting,
                          child: const LinearProgressIndicator(),
                        ),
                      ),
                      actions: [
                        Center(child: _DeleteMenuItemButton(item: resource)),
                        const SizedBox(width: 12.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              final now = DateTime.now();
                              context.read<EditMenuItemCubit>()
                                ..update(
                                  resource.copyWith(
                                    name: nameController.text,
                                    price:
                                        double.tryParse(priceController.text) ??
                                            0.0,
                                    description: descriptionController.text,
                                    updatedAt: now,
                                  ),
                                );
                            },
                            child: const Text('Save'),
                          ),
                        ),
                        const SizedBox(width: 24.0),
                      ],
                    ),
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.all(Spacing.pageSpacing),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            autofocus: true,
                            showCursor: true,
                            autocorrect: false,
                            cursorWidth: 3,
                            cursorHeight: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle!
                                .fontSize,
                            decoration: const InputDecoration(
                              hintText: 'Enter a name',
                              labelText: 'Name',
                            ),
                            style: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 24.0),
                          TextFormField(
                            controller: descriptionController,
                            showCursor: true,
                            cursorWidth: 3,
                            autocorrect: false,
                            cursorHeight: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle!
                                .fontSize,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              hintText: 'Enter a description',
                              labelText: 'Description',
                            ),
                            style: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 24.0),
                          TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              ValidatorInputFormatter(
                                editingValidator:
                                    DecimalNumberEditingRegexValidator(),
                              ),
                            ],
                            controller: priceController,
                            showCursor: true,
                            cursorWidth: 3,
                            cursorHeight: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle!
                                .fontSize,
                            decoration: const InputDecoration(
                              hintText: 'Enter a price',
                              labelText: 'Price',
                            ),
                            style: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 24.0),
                          TagSelector<CategoryEntity>(
                            initialItems: menuItemCategoriesState.categories,
                            fetchSuggestions: () async {
                              final storeId =
                                  await Locator.instance<StoreCacheService>()
                                      .get('storeId');
                              final categories = await FirebaseFirestore
                                  .instance
                                  .categoryEntitiesCollection(storeId: storeId)
                                  .get();
                              return categories.docs
                                  .map((e) => CategoryEntity.fromSnapshot(e))
                                  .toList();
                            },
                            suggestionConfigurationBuilder: (_, category) =>
                                SuggestionConfiguration(title: category.name),
                            emptyBuilder: (context) => const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text('No categories to select'),
                            ),
                            onSelect: (context, category) => context
                                .read<MenuItemCategoriesCubit>()
                                .addItemToCategory(category: category),
                            onRemove: (context, category) => context
                                .read<MenuItemCategoriesCubit>()
                                .removeItemFromCategory(category: category),
                            tagConfigurationBuilder: (_, category) =>
                                TagConfiguration(
                              title: category.name,
                              removable: true,
                            ),
                            textFieldConfiguration:
                                const TextFieldConfiguration(
                              decoration: InputDecoration(
                                hintText: 'Add to category',
                                labelText: 'Categories',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _DeleteMenuItemButton extends StatelessWidget {
  final MenuItemEntity item;

  const _DeleteMenuItemButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  void showConfirmationDialog({
    required BuildContext context,
    required MenuItemEntity item,
    required List<CategoryEntity> categories,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete ${item.name}?'),
          content: Text(
            'This will remove this item from all menus',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('NO'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('YES'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).errorColor),
              ),
            ),
          ],
        );
      },
    ).then((value) {
      if (value != null && value) {
        context.read<DeleteMenuItemCubit>().delete(
              item: item,
              categories: categories,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteMenuItemCubit, DeleteMenuItemState>(
      listener: (context, deleteMenuItemState) {
        if (deleteMenuItemState.status == DeleteMenuItemStatus.success) {
          Navigator.of(context).pop();
          ToastService.showNotification(const Text('Item deleted'));
        }
        if (deleteMenuItemState.status == DeleteMenuItemStatus.error) {
          Navigator.of(context).pop();
          ToastService.showNotification(
            const Text('Failed to delete'),
            ToastType.error,
          );
        }
      },
      builder: (context, deleteMenuItemState) {
        return BlocBuilder<MenuItemCategoriesCubit, MenuItemCategoriesState>(
          builder: (context, menuItemCategoriesState) {
            return OutlinedButton(
              onPressed: deleteMenuItemState.isDeleting
                  ? null
                  : () => showConfirmationDialog(
                        context: context,
                        item: item,
                        categories: menuItemCategoriesState.categories,
                      ),
              child: Text(
                'Delete',
                style: TextStyle(color: Theme.of(context).errorColor),
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.grey[100],
              ),
            );
          },
        );
      },
    );
  }
}
