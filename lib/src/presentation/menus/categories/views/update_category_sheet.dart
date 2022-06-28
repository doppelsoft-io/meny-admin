import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/categories/categories.dart';
import 'package:meny_admin/src/data/menu_categories/menu_categories.dart';
import 'package:meny_admin/src/data/menus/menus.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/resources/widgets/delete_resource_button.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/presentation/sheet_args.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/themes.dart';
import 'package:meny_core/meny_core.dart';

class UpdateCategorySheet extends StatelessWidget {
  const UpdateCategorySheet({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final CategoryModel resource;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const String routeName = '/updateCategorySheet';

  static Route route(SheetArgs? args) {
    return MaterialPageRoute<Widget>(
      fullscreenDialog: true,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EditCategoryCubit>(
              create: (context) => EditCategoryCubit(
                storeCubit: context.read<StoreCubit>(),
              )..loadCategory(args!.resource as CategoryModel),
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
          child: const _UpdateCategorySheet(),
        );
      },
    );
  }

  static Future<Object?> open({
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
                failure: CustomException(message: exception.toString()),
              );
            },
            loaded: (category) {
              context
                  .read<MenuCategoriesCubit>()
                  .load(categoryId: category.id!);
              controller.text = category.name;
            },
            orElse: () {},
          );
        },
        builder: (context, editCategoryState) {
          return editCategoryState.maybeWhen(
            loading: (_) => ScaffoldBuilder.loading(),
            orElse: () {
              return BlocBuilder<MenuCategoriesCubit, MenuCategoriesState>(
                builder: (context, menuCategoriesState) {
                  return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      iconTheme: const IconThemeData(color: Colors.black),
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Edit Category',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(8),
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
                        HorizontalSpacing.small(),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              final isValid = UpdateCategorySheet
                                  ._formKey.currentState!
                                  .validate();
                              if (!isValid) return;
                              context.read<EditCategoryCubit>().update(
                                    editCategoryState.category.copyWith(
                                      name: controller.text,
                                      updatedAt: DateTime.now(),
                                    ),
                                  );
                            },
                            child: const Text('Save'),
                          ),
                        ),
                        HorizontalSpacing.medium(),
                      ],
                    ),
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: UpdateCategorySheet._formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DText.subtitle1('Name'),
                            VerticalSpacing.smallest(),
                            DTextFormField(
                              theme: Themes.theme.textFormFieldThemeData,
                              args: DTextFormFieldArgs(
                                controller: controller,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: 'Enter a name',
                                ),
                                validator: (value) =>
                                    FormValidatorHelper.validateExists(
                                  value,
                                  message:
                                      'Please enter a name for your category',
                                ),
                              ),
                            ),
                            VerticalSpacing.large(),
                            DText.subtitle1('Add to menu'),
                            VerticalSpacing.smallest(),
                            TagSelector<MenuModel>(
                              initialItems: menuCategoriesState.menus,
                              fetchSuggestions: () async {
                                final storeId =
                                    context.read<StoreCubit>().state.store.id!;
                                return Locator.instance<MenuRepository>()
                                    .getAll(storeId: storeId)
                                    .first;
                              },
                              suggestionConfigurationBuilder: (_, menu) =>
                                  SuggestionConfiguration(
                                title: menu.name,
                              ),
                              emptyBuilder: (context) {
                                return const Padding(
                                  padding: EdgeInsets.all(20),
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
                                ),
                              ),
                            ),
                          ],
                        ),
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
      showDialog<bool>(
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
        if (value != null && value) {
          context.read<DeleteCategoryCubit>().delete(
                category: category,
                menus: menus,
              );
          return Future.value(true);
        }
        return Future.value(value);
      });
    }
    return Future.value(true);
  }
}

class _DeleteCategoryButton extends StatelessWidget {
  const _DeleteCategoryButton({
    Key? key,
    required this.category,
    required this.menus,
  }) : super(key: key);

  final CategoryModel category;
  final List<MenuModel> menus;

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
        return DeleteResourceButton(
          args: DeleteResourceButtonArgs(
            onPressed: deleteCategoryState.maybeWhen(
              deleting: () => null,
              orElse: () => () async {
                final value = await DConfirmDialog.open<bool>(
                  context,
                  args: DConfirmDialogArgs(
                    title: Text('Delete ${category.name}?'),
                    content: Text(
                      'This will remove this category from all menus.\nNote: this will NOT delete any menu items that were in this category',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    confirmArgs: DConfirmDialogConfirmArgs(
                      buttonStyle: ElevatedButton.styleFrom(
                        primary: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                );
                if (value != null && value) {
                  // ignore: use_build_context_synchronously
                  await context.read<DeleteCategoryCubit>().delete(
                        category: category,
                        menus: menus,
                      );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
