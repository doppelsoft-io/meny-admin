import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_categories/menu_categories.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/presentation/sheet_args.dart';
import 'package:meny/src/services/services.dart';

class UpdateCategorySheet extends StatelessWidget {
  const UpdateCategorySheet({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final CategoryModel resource;

  static const String routeName = '/updateCategorySheet';

  static Route route(SheetArgs args) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EditCategoryCubit>(
              create: (context) => EditCategoryCubit(
                storeCubit: context.read<StoreCubit>(),
              )..loadCategory(args.resource as CategoryModel),
            ),
            BlocProvider<DeleteCategoryCubit>(
              create: (context) => DeleteCategoryCubit(
                storeCubit: context.read<StoreCubit>(),
              ),
            ),
            BlocProvider<MenuCategoriesCubit>(
              create: (context) => MenuCategoriesCubit(
                storeCubit: context.read<StoreCubit>(),
              ),
            ),
          ],
          child: _UpdateCategorySheet(),
        );
      },
    );
  }

  static open({
    required BuildContext context,
    required CategoryModel resource,
  }) {
    return Navigator.of(context).pushNamed(
      UpdateCategorySheet.routeName,
      arguments: SheetArgs(resource: resource),
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _UpdateCategorySheet extends HookWidget {
  const _UpdateCategorySheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editCategoryState = context.watch<EditCategoryCubit>().state;
    final menuCategoriesState = context.watch<MenuCategoriesCubit>().state;
    final deleteCategoryState = context.watch<DeleteCategoryCubit>().state;
    final controller = useTextEditingController(
      text: editCategoryState.category.name,
    );

    return WillPopScope(
      onWillPop: () => _onWillPop(
        context: context,
        category: editCategoryState.category,
        menus: menuCategoriesState.menus,
      ),
      child: BlocConsumer<EditCategoryCubit, EditCategoryState>(
        listener: (context, editCategoryState) {
          editCategoryState.maybeWhen(
            success: (_) => Navigator.pop(context),
            error: (category, exception) {
              DialogService.showErrorDialog(
                context: context,
                failure: Failure(message: exception.toString()),
              );
            },
            loaded: (category) {
              context
                  .read<MenuCategoriesCubit>()
                  .load(categoryId: category.id!);
              controller..text = category.name;
            },
            orElse: () {},
          );
        },
        builder: (context, editCategoryState) {
          return editCategoryState.maybeWhen(
            loading: (_) => ScaffoldBuilder.loading(),
            error: (_, exception) =>
                ScaffoldBuilder.error(exception: exception),
            orElse: () {
              return BlocBuilder<MenuCategoriesCubit, MenuCategoriesState>(
                builder: (context, menuCategoriesState) {
                  return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      automaticallyImplyLeading: true,
                      iconTheme: const IconThemeData(color: Colors.black),
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Edit Category',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(8.0),
                        child: Visibility(
                          visible: editCategoryState.maybeWhen(
                                orElse: () => false,
                                updating: (_) => true,
                              ) ||
                              deleteCategoryState.maybeWhen(
                                orElse: () => false,
                                deleting: () => true,
                              ),
                          child: const LinearProgressIndicator(),
                        ),
                      ),
                      actions: [
                        Center(
                          child: _DeleteCategoryButton(
                            category: editCategoryState.category,
                            menus: menuCategoriesState.menus,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () =>
                                context.read<EditCategoryCubit>().update(
                                      editCategoryState.category.copyWith(
                                        name: controller.text,
                                        updatedAt: DateTime.now(),
                                      ),
                                    ),
                            child: const Text('Save'),
                          ),
                        ),
                        const SizedBox(width: 24.0),
                      ],
                    ),
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller,
                            autofocus: true,
                            showCursor: true,
                            cursorWidth: 2,
                            decoration: const InputDecoration(
                              hintText: 'Enter a name',
                              labelText: 'Name',
                            ),
                            style: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle,
                          ),
                          const SizedBox(height: 24.0),
                          TagSelector<MenuModel>(
                            initialItems: menuCategoriesState.menus,
                            fetchSuggestions: () {
                              final storeId =
                                  context.read<StoreCubit>().state.store!.id!;
                              return Locator.instance<MenuRepository>()
                                  .getAll(storeId: storeId)
                                  .first;
                            },
                            suggestionConfigurationBuilder: (_, menu) =>
                                SuggestionConfiguration(title: menu.name),
                            emptyBuilder: (context) {
                              return const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('No menus to select'),
                              );
                            },
                            onSelect: (context, menu) => context
                                .read<MenuCategoriesCubit>()
                                .createMenuCategory(
                                  menu: menu,
                                  category: editCategoryState.category,
                                ),
                            onRemove: (context, menu) => context
                                .read<MenuCategoriesCubit>()
                                .removeMenuCategory(
                                  menu: menu,
                                  category: editCategoryState.category,
                                ),
                            tagConfigurationBuilder: (_, menu) {
                              return TagConfiguration(
                                title: menu.name,
                                removable: true,
                              );
                            },
                            textFieldConfiguration:
                                const TextFieldConfiguration(
                              decoration: InputDecoration(
                                hintText: 'Add to menu',
                                labelText: 'Menus',
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

  Future<bool> _onWillPop({
    required BuildContext context,
    required List<MenuModel> menus,
    required CategoryModel category,
  }) {
    if (category.name.isEmpty) {
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
          context.read<DeleteCategoryCubit>().delete(
                category: category,
                menus: menus,
              );
          return Future.value(true);
        }
        return Future.value(false);
      });
    }
    return Future.value(true);
  }
}

class _DeleteCategoryButton extends StatelessWidget {
  final CategoryModel category;
  final List<MenuModel> menus;

  const _DeleteCategoryButton({
    Key? key,
    required this.category,
    required this.menus,
  }) : super(key: key);

  Future<bool> showConfirmationDialog({
    required BuildContext context,
    required CategoryModel category,
    required List<MenuModel> menus,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete ${category.name}?'),
          content: Text(
            'This will remove this category from all menus.\nNote: this will NOT delete any menu items that were in this category',
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
        context.read<DeleteCategoryCubit>().delete(
              category: category,
              menus: menus,
            );
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
      listener: (context, deleteCategoryState) {
        deleteCategoryState.maybeWhen(
          success: () {
            Navigator.of(context).pop();
            if (category.name.isNotEmpty) {
              ToastService.toast('Category deleted');
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
      builder: (context, deleteCategoryState) {
        return OutlinedButton(
          onPressed: deleteCategoryState.maybeWhen(
            deleting: () {},
            orElse: () => () => showConfirmationDialog(
                  context: context,
                  category: category,
                  menus: menus,
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
  }
}
