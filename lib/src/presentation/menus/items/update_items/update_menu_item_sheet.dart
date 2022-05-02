import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/category_menu_items/category_menu_items.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/presentation/sheet_args.dart';
import 'package:meny/src/services/services.dart';
import 'package:meny/src/utils/utils.dart';

class UpdateMenuItemSheet extends StatelessWidget {
  const UpdateMenuItemSheet({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final MenuItemModel resource;

  static const String routeName = '/updateMenuItem';

  static Route route(SheetArgs args) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EditMenuItemCubit>(
              create: (context) => EditMenuItemCubit(
                storeCubit: context.read<StoreCubit>(),
              )..loadItem(args.resource as MenuItemModel),
            ),
            BlocProvider<CategoryMenuItemsCubit>(
              create: (context) => CategoryMenuItemsCubit(
                storeCubit: context.read<StoreCubit>(),
              ),
            ),
            BlocProvider<DeleteMenuItemCubit>(
              create: (context) => DeleteMenuItemCubit(
                storeCubit: context.read<StoreCubit>(),
              ),
            ),
          ],
          child: _UpdateMenuItemSheet(),
        );
      },
    );
  }

  static open({
    required BuildContext context,
    required MenuItemModel resource,
  }) {
    return Navigator.of(context).pushNamed(
      UpdateMenuItemSheet.routeName,
      arguments: SheetArgs(resource: resource),
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _UpdateMenuItemSheet extends HookWidget {
  const _UpdateMenuItemSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editMenuItemState = context.watch<EditMenuItemCubit>().state;
    final categoryMenuItemsState =
        context.watch<CategoryMenuItemsCubit>().state;
    final deleteMenuItemState = context.watch<DeleteMenuItemCubit>().state;

    final item = editMenuItemState.item;

    final nameController = useTextEditingController();

    final descriptionController = useTextEditingController();

    final priceController = useTextEditingController();

    useEffect(() {});

    return WillPopScope(
      onWillPop: () => _onWillPop(
        context: context,
        item: item,
        categories: categoryMenuItemsState.categories,
      ),
      child: BlocConsumer<EditMenuItemCubit, EditMenuItemState>(
        listener: (context, editMenuItemState) {
          editMenuItemState.maybeWhen(
            success: (_) => Navigator.pop(context),
            error: (category, exception) {
              DialogService.showErrorDialog(
                context: context,
                failure: Failure(message: exception.toString()),
              );
            },
            loaded: (item) {
              nameController..text = item.name;
              descriptionController..text = item.description;
              priceController..text = item.price.toString();
              context.read<CategoryMenuItemsCubit>().load(menuItemId: item.id!);
            },
            orElse: () {},
          );
        },
        builder: (context, editMenuItemState) {
          return editMenuItemState.maybeWhen(
            loading: (_) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: true,
                centerTitle: false,
                iconTheme: const IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
              ),
              body: Center(child: CircularProgressIndicator()),
            ),
            error: (_, exception) {
              return Scaffold(
                appBar: AppBar(automaticallyImplyLeading: true),
                body: ErrorDisplay(
                  failure: Failure(
                    message: exception.toString(),
                  ),
                ),
              );
            },
            orElse: () {
              return BlocBuilder<CategoryMenuItemsCubit,
                  CategoryMenuItemsState>(
                builder: (context, categoryMenuItemsState) {
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
                          visible: editMenuItemState.maybeWhen(
                                orElse: () => false,
                                updating: (_) => true,
                              ) ||
                              deleteMenuItemState.maybeWhen(
                                orElse: () => false,
                                deleting: () => true,
                              ),
                          child: const LinearProgressIndicator(),
                        ),
                      ),
                      actions: [
                        Center(child: _DeleteMenuItemButton(item: item)),
                        const SizedBox(width: 12.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              final now = DateTime.now();
                              context.read<EditMenuItemCubit>()
                                ..update(
                                  item.copyWith(
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
                              decimal: true,
                            ),
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
                          TagSelector<CategoryModel>(
                            initialItems: categoryMenuItemsState.categories,
                            fetchSuggestions: () {
                              final storeId =
                                  context.read<StoreCubit>().state.store!.id!;

                              return Locator.instance<CategoryRepository>()
                                  .getAll(storeId: storeId)
                                  .first;
                            },
                            suggestionConfigurationBuilder: (_, category) =>
                                SuggestionConfiguration(title: category.name),
                            emptyBuilder: (context) => const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text('No categories'),
                            ),
                            onSelect: (context, category) {
                              context
                                  .read<CategoryMenuItemsCubit>()
                                  .createCategoryMenuItem(
                                    category: category,
                                    item: item,
                                  );
                            },
                            onRemove: (context, category) => context
                                .read<CategoryMenuItemsCubit>()
                                .removeMenuCategory(
                                  category: category,
                                  item: item,
                                ),
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
          );
        },
      ),
    );
  }

  void _setValues(BuildContext context) {
    final state = context.watch<EditMenuItemCubit>().state;
    state.maybeWhen(
      loaded: (item) {},
      orElse: () {},
    );
  }

  Future<bool> _onWillPop({
    required BuildContext context,
    required MenuItemModel item,
    required List<CategoryModel> categories,
  }) {
    if (item.name.isEmpty) {
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
                item: item,
                categories: categories,
              );
          return Future.value(true);
        }
        return Future.value(false);
      });
    }
    return Future.value(true);
  }
}

class _DeleteMenuItemButton extends StatelessWidget {
  final MenuItemModel item;

  const _DeleteMenuItemButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  void showConfirmationDialog({
    required BuildContext context,
    required MenuItemModel item,
    required List<CategoryModel> categories,
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
        deleteMenuItemState.maybeWhen(
          success: () {
            Navigator.of(context).pop();
            if (item.name.isNotEmpty) {
              ToastService.toast('Item deleted');
            }
          },
          error: (exception) {
            Navigator.of(context).pop();
            ToastService.showNotification(
              Text(exception.toString()),
              ToastType.error,
            );
          },
          orElse: () {},
        );
      },
      builder: (context, deleteMenuItemState) {
        return BlocBuilder<CategoryMenuItemsCubit, CategoryMenuItemsState>(
          builder: (context, categoryMenuItemsState) {
            return OutlinedButton(
              onPressed: deleteMenuItemState.maybeWhen(
                deleting: () {},
                orElse: () => () => showConfirmationDialog(
                      context: context,
                      item: item,
                      categories: categoryMenuItemsState.categories,
                    ),
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
