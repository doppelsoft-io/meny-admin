import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/presentation/sheet_args.dart';
import 'package:meny/src/services/services.dart';

class UpdateCategorySheet extends HookWidget {
  static const String routeName = '/updateCategorySheet';
  static Route route(SheetArgs args) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EditCategoryCubit>(
              create: (context) => EditCategoryCubit()
                ..loadCategory(args.resource as CategoryEntity),
            ),
            BlocProvider<DeleteCategoryCubit>(
              create: (context) => DeleteCategoryCubit(),
            ),
          ],
          child: BlocConsumer<EditCategoryCubit, EditCategoryState>(
            listener: (context, state) {
              if (state.isSuccess) {
                Navigator.pop(context);
              }
              if (state.isError) {
                DialogService.showErrorDialog(
                  context: context,
                  failure: state.failure!,
                );
              }
            },
            builder: (context, state) {
              if (state.category != null) {
                final category = state.category!;
                return BlocProvider<CategoryMenusCubit>(
                  create: (context) => CategoryMenusCubit(category: category),
                  child: UpdateCategorySheet(
                    resource: category,
                  ),
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

  final CategoryEntity resource;

  const UpdateCategorySheet({
    Key? key,
    required this.resource,
  }) : super(key: key);

  static open({
    required BuildContext context,
    required CategoryEntity resource,
  }) {
    return Navigator.of(context).pushNamed(
      UpdateCategorySheet.routeName,
      arguments: SheetArgs(resource: resource),
    );
  }

  Future<bool> _onWillPop({
    required BuildContext context,
    required List<MenuEntity> menus,
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
          context.read<DeleteCategoryCubit>().delete(
                category: resource,
                menus: menus,
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
    final controller = useTextEditingController(text: resource.name);

    return BlocBuilder<CategoryMenusCubit, CategoryMenusState>(
      builder: (context, categoryMenusState) {
        return WillPopScope(
          onWillPop: () => _onWillPop(
            context: context,
            menus: categoryMenusState.menus,
          ),
          child: BlocBuilder<EditCategoryCubit, EditCategoryState>(
            builder: (context, editCategoryState) {
              return BlocBuilder<DeleteCategoryCubit, DeleteCategoryState>(
                builder: (context, deleteCategoryState) {
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
                          visible: editCategoryState.isUpdating ||
                              deleteCategoryState.isDeleting,
                          child: const LinearProgressIndicator(),
                        ),
                      ),
                      actions: [
                        Center(
                            child: _DeleteCategoryButton(category: resource)),
                        const SizedBox(width: 12.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<EditCategoryCubit>()
                                  .update(resource.copyWith(
                                    name: controller.text,
                                    updatedAt: DateTime.now(),
                                  ));
                            },
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
                          TagSelector<MenuEntity>(
                            initialItems: categoryMenusState.menus,
                            fetchSuggestions: () async {
                              final menus = await FirebaseFirestore.instance
                                  .collection(Paths.menus)
                                  .get();
                              return menus.docs
                                  .map((e) => MenuEntity.fromSnapshot(e))
                                  .toList();
                            },
                            suggestionConfigurationBuilder: (context, menu) {
                              return SuggestionConfiguration(
                                title: menu.name,
                              );
                            },
                            emptyBuilder: (context) {
                              return const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('No menus to select'),
                              );
                            },
                            onSelect: (context, menu) {
                              context
                                  .read<CategoryMenusCubit>()
                                  .addCategoryToMenu(menu: menu);
                            },
                            onRemove: (context, menu) {
                              context
                                  .read<CategoryMenusCubit>()
                                  .removeCategoryFromMenu(menu: menu);
                            },
                            tagConfigurationBuilder: (context, menu) {
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
          ),
        );
      },
    );
  }
}

class _DeleteCategoryButton extends StatelessWidget {
  final CategoryEntity category;

  const _DeleteCategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  void showConfirmationDialog({
    required BuildContext context,
    required CategoryEntity category,
    required List<MenuEntity> menus,
  }) {
    showDialog(
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
      listener: (context, deleteCategoryState) {
        if (deleteCategoryState.status == DeleteCategoryStatus.success) {
          Navigator.of(context).pop();
          ToastService.showNotification(const Text('Category deleted'));
        }
      },
      builder: (context, deleteCategoryState) {
        return BlocBuilder<CategoryMenusCubit, CategoryMenusState>(
          builder: (context, categoryMenusState) {
            return OutlinedButton(
              onPressed: deleteCategoryState.isDeleting
                  ? null
                  : () => showConfirmationDialog(
                        context: context,
                        category: category,
                        menus: categoryMenusState.menus,
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
