import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/categories/categories.dart';
import 'package:meny_admin/src/data/categories/src/cubits/create_category/create_category_cubit.dart';
import 'package:meny_admin/src/data/menu_categories/menu_categories.dart';
import 'package:meny_admin/src/data/menus/menus.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/resources/resources.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/themes.dart';
import 'package:meny_core/meny_core.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  static const String routeName = 'edit-category';

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateCategoryCubit>(
          create: (context) => CreateCategoryCubit(
            storeCubit: context.read<StoreCubit>(),
          ),
        ),
        BlocProvider<EditCategoryCubit>(
          create: (context) => EditCategoryCubit(
            storeCubit: context.read<StoreCubit>(),
          )..loadCategory(id: id),
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
      child: const _EditCategoryScreen(),
    );
  }
}

class _EditCategoryScreen extends HookWidget {
  const _EditCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createCategoryState = context.watch<CreateCategoryCubit>().state;
    final editCategoryState = context.watch<EditCategoryCubit>().state;
    final menuCategoriesState = context.watch<MenuCategoriesCubit>().state;
    final deleteCategoryState = context.watch<DeleteCategoryCubit>().state;
    final controller = useTextEditingController(
      text: editCategoryState.category.name,
    );

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

    return WillPopScope(
      onWillPop: () => _onWillPop(
        context: context,
        category: editCategoryState.category,
        menus: menuCategoriesState.menus,
      ),
      child: BlocConsumer<EditCategoryCubit, EditCategoryState>(
        listener: (context, editCategoryState) {
          editCategoryState.maybeWhen(
            success: (category) {
              Navigator.pop(context);
              Locator.instance<ToastService>().showOverlay(
                Text('Your category ${category.name} has been saved'),
              );
            },
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
                        DSHorizontalSpacing.small(),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              final isValid = EditCategoryScreen
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
                        DSHorizontalSpacing.medium(),
                      ],
                    ),
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: EditCategoryScreen._formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DSText.subtitle1('Name'),
                            DSVerticalSpacing.smallest(),
                            DSTextFormField(
                              theme: Themes.theme.textFormFieldThemeData,
                              args: DSTextFormFieldArgs(
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
                            DSVerticalSpacing.large(),
                            DSText.subtitle1('Add to menu'),
                            DSVerticalSpacing.smallest(),
                            TagSelector<MenuModel>(
                              context: context,
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
              Locator.instance<ToastService>().showOverlay(
                Text('Your category ${category.name} has been deleted'),
                ToastType.error,
              );
            }
          },
          error: (exception) {
            Navigator.of(context).pop();
            DialogService.showErrorDialog(
              context: context,
              failure: CustomException(message: exception.toString()),
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
                final value = await DSConfirmDialog.open<bool>(
                  context,
                  args: DSConfirmDialogArgs(
                    title: Text('Delete ${category.name}?'),
                    content: Text(
                      'This will remove this category from all menus.\nNote: this will NOT delete any menu items that were in this category',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    confirmArgs: DSConfirmDialogConfirmArgs(
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
