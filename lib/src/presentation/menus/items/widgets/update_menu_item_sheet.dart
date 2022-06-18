import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/categories/categories.dart';
import 'package:meny_admin/src/data/category_menu_items/category_menu_items.dart';
import 'package:meny_admin/src/data/menu_item_modifier_groups/cubits/menu_item_modifier_groups_cubit.dart';
import 'package:meny_admin/src/data/menu_items/menu_items.dart';
import 'package:meny_admin/src/data/modifier_groups/modifier_groups.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/resources/widgets/delete_resource_button.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/presentation/sheet_args.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/src/utils/utils.dart';
import 'package:meny_admin/themes.dart';
import 'package:meny_core/meny_core.dart';

class UpdateMenuItemSheet extends StatelessWidget {
  const UpdateMenuItemSheet({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final MenuItemModel resource;

  static const String routeName = '/updateMenuItem';

  static Route route(SheetArgs args) {
    return MaterialPageRoute<Widget>(
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
            BlocProvider<MenuItemModifierGroupsCubit>(
              create: (context) => MenuItemModifierGroupsCubit(
                storeCubit: context.read<StoreCubit>(),
              ),
            ),
            BlocProvider<ImageUploadCubit>(
              create: (context) => ImageUploadCubit(
                storeCubit: context.read<StoreCubit>(),
              ),
            ),
          ],
          child: const _UpdateMenuItemSheet(),
        );
      },
    );
  }

  static Future<Object?> open({
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
    final deleteMenuItemState = context.watch<DeleteMenuItemCubit>().state;
    final imageUploadState = context.watch<ImageUploadCubit>().state;
    final item = editMenuItemState.item;
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final priceController = useTextEditingController();

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: BlocConsumer<EditMenuItemCubit, EditMenuItemState>(
        listener: (context, editMenuItemState) {
          editMenuItemState.maybeWhen(
            success: (_) => Navigator.pop(context),
            error: (category, exception) {
              DialogService.showErrorDialog(
                context: context,
                failure: CustomException(message: exception.toString()),
              );
            },
            loaded: (item) {
              _setInitialValues(
                context,
                nameController,
                descriptionController,
                priceController,
              );
              context.read<CategoryMenuItemsCubit>().load(menuItemId: item.id!);
              context
                  .read<MenuItemModifierGroupsCubit>()
                  .load(menuItemId: item.id!);
            },
            orElse: () {},
          );
        },
        builder: (context, editMenuItemState) {
          return editMenuItemState.maybeWhen(
            loading: (_) => ScaffoldBuilder.loading(),
            error: (_, exception) => ScaffoldBuilder.error(
              exception: exception,
            ),
            orElse: () {
              return BlocBuilder<CategoryMenuItemsCubit,
                  CategoryMenuItemsState>(
                builder: (context, categoryMenuItemsState) {
                  return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      iconTheme: const IconThemeData(color: Colors.black),
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Edit Item',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(8),
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
                        HorizontalSpacing.small(),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              final now = DateTime.now();
                              context.read<EditMenuItemCubit>().update(
                                    item.copyWith(
                                      name: nameController.text,
                                      priceInfo: PriceInfoModel(
                                        price: ((double.tryParse(
                                                      priceController.text,
                                                    ) ??
                                                    0) *
                                                100)
                                            .toInt(),
                                      ),
                                      description: descriptionController.text,
                                      updatedAt: now,
                                      imageUrl: imageUploadState.url.isNotEmpty
                                          ? imageUploadState.url
                                          : null,
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
                      padding: const EdgeInsets.all(Spacing.pageSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DText.subtitle1('Name'),
                          VerticalSpacing.smallest(),
                          _NameField(nameController: nameController),
                          VerticalSpacing.large(),
                          DText.subtitle1('Description'),
                          VerticalSpacing.smallest(),
                          _DescriptionField(
                            descriptionController: descriptionController,
                          ),
                          VerticalSpacing.large(),
                          if (item.type == MenuItemType.item) ...[
                            DText.subtitle1('Photo'),
                            VerticalSpacing.smallest(),
                            _ImageUpload(item: item),
                            VerticalSpacing.large(),
                          ],
                          DText.subtitle1('Availability'),
                          VerticalSpacing.smallest(),
                          const _SuspensionRules(),
                          VerticalSpacing.large(),
                          DText.subtitle1('Price'),
                          VerticalSpacing.smallest(),
                          _PriceField(priceController: priceController),
                          VerticalSpacing.large(),
                          DText.subtitle1('Categories'),
                          DText.caption(
                            'Select which categories this item will appear in',
                          ),
                          VerticalSpacing.small(),
                          _CategorySelector(item: item),
                          VerticalSpacing.large(),
                          DText.subtitle1('Modifier Groups'),
                          VerticalSpacing.smallest(),
                          _ModifierGroupSelector(item: item),
                          const SizedBox(height: 100),
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

  void _setInitialValues(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController descriptionController,
    TextEditingController priceController,
  ) {
    context.read<EditMenuItemCubit>().state.maybeWhen(
          loaded: (item) {
            nameController.text = item.name;
            descriptionController.text = item.description;
            priceController.text = (item.priceInfo.price / 100)
                .toCurrency(excludeDollarSign: true);
            if (item.imageUrl != null) {
              context.read<ImageUploadCubit>().seed(url: item.imageUrl!);
            }
          },
          orElse: () {},
        );
  }

  Future<bool> _onWillPop(BuildContext context) {
    final item = context.read<EditMenuItemCubit>().state.item;
    final categories = context.read<CategoryMenuItemsCubit>().state.categories;
    final modifierGroups =
        context.read<MenuItemModifierGroupsCubit>().state.groups;

    if (item.name.isEmpty) {
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
          context.read<DeleteMenuItemCubit>().delete(
                item: item,
                categories: categories,
                modifierGroups: modifierGroups,
              );
          return Future.value(true);
        }
        return Future.value(false);
      });
    }
    return Future.value(true);
  }
}

class _SuspensionRules extends HookWidget {
  const _SuspensionRules({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemState = context.watch<EditMenuItemCubit>().state;
    final suspensionReasonController = useTextEditingController(
      text: itemState.maybeWhen(
        loaded: (_) => _.suspensionRules?.suspension.reason ?? '',
        orElse: () => '',
      ),
    );
    final suspensionReasonDebouncer =
        DDebouncer(delay: const Duration(milliseconds: 300));

    return itemState.maybeWhen(
      loaded: (item) {
        return Column(
          children: [
            DCheckbox(
              theme: Themes.theme.checkboxThemeData,
              args: DCheckboxArgs(
                title: const Text('Is item available?'),
                value: item.suspensionRules == null,
                enableFeedback: true,
                onChanged: (available) {
                  if (available != null && available) {
                    final updatedItem = item.copyWith(suspensionRules: null);
                    suspensionReasonController.clear();
                    context.read<EditMenuItemCubit>().update(
                          updatedItem,
                          save: false,
                        );
                  } else {
                    final suspensionRules =
                        item.suspensionRules ?? SuspensionRulesModel.empty();
                    final updatedItem = item.copyWith(
                      suspensionRules: suspensionRules.copyWith(
                        suspension: SuspensionRulesSuspension(
                          isSuspended: true,
                        ),
                      ),
                    );
                    context.read<EditMenuItemCubit>().update(
                          updatedItem,
                          save: false,
                        );
                  }
                },
              ),
            ),
            // CheckboxListTile(
            //   enableFeedback: true,
            //   contentPadding: EdgeInsets.zero,
            //   controlAffinity: ListTileControlAffinity.leading,
            //   title: const Text('Is item available?'),
            //   value: item.suspensionRules == null,
            //   onChanged: (available) {
            //     if (available != null && available) {
            //       final updatedItem = item.copyWith(suspensionRules: null);
            //       suspensionReasonController.clear();
            //       context.read<EditMenuItemCubit>().update(
            //             updatedItem,
            //             save: false,
            //           );
            //     } else {
            //       final suspensionRules =
            //           item.suspensionRules ?? SuspensionRulesModel.empty();
            //       final updatedItem = item.copyWith(
            //         suspensionRules: suspensionRules.copyWith(
            //           suspension: SuspensionRulesSuspension(
            //             isSuspended: true,
            //           ),
            //         ),
            //       );
            //       context.read<EditMenuItemCubit>().update(
            //             updatedItem,
            //             save: false,
            //           );
            //     }
            //   },
            // ),
            if (item.suspensionRules != null) ...[
              VerticalSpacing.small(),
              DTextFormField(
                theme: Themes.theme.textFormFieldThemeData,
                args: DTextFormFieldArgs(
                  controller: suspensionReasonController,
                  onChanged: (reason) {
                    suspensionReasonDebouncer.run(() {
                      final item = context.read<EditMenuItemCubit>().state.item;
                      final suspension = item.suspensionRules!.suspension;
                      final updatedItem = item.copyWith(
                        suspensionRules: item.suspensionRules!.copyWith(
                          suspension: suspension.copyWith(
                            reason: reason,
                          ),
                        ),
                      );
                      context.read<EditMenuItemCubit>().update(
                            updatedItem,
                            save: false,
                          );
                    });
                  },
                  decoration: const InputDecoration(
                    hintText:
                        "Enter a reason for the item's suspension (optional)",
                  ),
                ),
              ),
              VerticalSpacing.medium(),
            ],
          ],
        );
      },
      orElse: SizedBox.shrink,
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MenuItemModel item;

  @override
  Widget build(BuildContext context) {
    final categoryMenuItemsState =
        context.watch<CategoryMenuItemsCubit>().state;

    return TagSelector<CategoryModel>(
      initialItems: categoryMenuItemsState.categories,
      fetchSuggestions: () {
        final storeId = context.read<StoreCubit>().state.store.id!;

        return Locator.instance<CategoryRepository>()
            .getAll(storeId: storeId)
            .first;
      },
      suggestionConfigurationBuilder: (_, category) => SuggestionConfiguration(
        title: category.name,
      ),
      emptyBuilder: (context) => const Padding(
        padding: EdgeInsets.all(20),
        child: Text('No categories'),
      ),
      onSelect: (context, category) {
        context.read<CategoryMenuItemsCubit>().createCategoryMenuItem(
              category: category,
              item: item,
            );
      },
      onRemove: (context, category) =>
          context.read<CategoryMenuItemsCubit>().removeMenuCategory(
                category: category,
                item: item,
              ),
      tagConfigurationBuilder: (_, category) => TagConfiguration(
        title: category.name,
        removable: true,
      ),
      textFieldConfiguration: const TextFieldConfiguration(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(Icons.search, color: Colors.black),
          hintText: 'Add to category',
        ),
      ),
    );
  }
}

class _ModifierGroupSelector extends StatelessWidget {
  const _ModifierGroupSelector({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MenuItemModel item;

  @override
  Widget build(BuildContext context) {
    final menuItemModifierGroupsState =
        context.watch<MenuItemModifierGroupsCubit>().state;

    return TagSelector<ModifierGroupModel>(
      initialItems: menuItemModifierGroupsState.groups,
      fetchSuggestions: () {
        final storeId = context.read<StoreCubit>().state.store.id!;

        return Locator.instance<ModifierGroupRepository>()
            .getAll(storeId: storeId)
            .first;
      },
      suggestionConfigurationBuilder: (context, modifierGroup) {
        return SuggestionConfiguration(
          title: modifierGroup.name,
        );
      },
      tagConfigurationBuilder: (_, modifierGroup) {
        return TagConfiguration(
          title: modifierGroup.name,
          removable: true,
        );
      },
      onSelect: (_, modifierGroup) {
        context.read<MenuItemModifierGroupsCubit>().createMenuItemModifierGroup(
              item: item,
              modifierGroup: modifierGroup,
            );
      },
      onRemove: (_, modifierGroup) {
        context.read<MenuItemModifierGroupsCubit>().removeMenuItemModifierGroup(
              item: item,
              modifierGroup: modifierGroup,
            );
      },
      emptyBuilder: (_) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Text('No modifier groups'),
        );
      },
      textFieldConfiguration: const TextFieldConfiguration(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.black),
          hintText: 'Add a modifier group',
        ),
      ),
    );
  }
}

class _PriceField extends StatelessWidget {
  const _PriceField({
    Key? key,
    required this.priceController,
  }) : super(key: key);

  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return DTextFormField(
      theme: Themes.theme.textFormFieldThemeData,
      args: DTextFormFieldArgs(
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
        ),
        inputFormatters: [
          ValidatorInputFormatter(
            editingValidator: DecimalNumberEditingRegexValidator(),
          ),
        ],
        controller: priceController,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.attach_money,
            color: Colors.black,
          ),
          hintText: 'Enter a price',
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _ImageUpload extends StatelessWidget {
  const _ImageUpload({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MenuItemModel item;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageUploadCubit, ImageUploadState>(
      listener: (context, state) {
        state.maybeWhen(
          picked: (file, url) =>
              context.read<ImageUploadCubit>().upload(item: item),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DImageUploadCard(
              url: state.url,
              processing: state.maybeWhen(
                uploading: (_, __) => true,
                orElse: () => false,
              ),
              onTap: () => context.read<ImageUploadCubit>().pick(),
              emptyBuilder: () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(child: Icon(Icons.image)),
                  Text('Click to upload')
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Photos of your menu items can help customers when deciding to order and can increase sales.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField({
    Key? key,
    required this.descriptionController,
  }) : super(key: key);

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return DTextFormField(
      theme: Themes.theme.textFormFieldThemeData.copyWith(
        maxLines: 3,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      args: DTextFormFieldArgs(
        controller: descriptionController,
        autocorrect: false,
        decoration: const InputDecoration(
          hintText: 'Enter a description',
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return DTextFormField(
      theme: Themes.theme.textFormFieldThemeData,
      args: DTextFormFieldArgs(
        controller: nameController,
        autofocus: true,
        autocorrect: false,
        decoration: const InputDecoration(
          hintText: 'Enter a name',
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _DeleteMenuItemButton extends StatelessWidget {
  const _DeleteMenuItemButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MenuItemModel item;

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
        final categories =
            context.watch<CategoryMenuItemsCubit>().state.categories;
        final modifierGroups =
            context.watch<MenuItemModifierGroupsCubit>().state.groups;

        return DeleteResourceButton(
          args: DeleteResourceButtonArgs(
            onPressed: deleteMenuItemState.maybeWhen(
              deleting: () => null,
              orElse: () => () async {
                final result = await DConfirmDialog.open<bool>(
                  context,
                  args: DConfirmDialogArgs(
                    title: Text('Delete ${item.name}?'),
                    content: Text(
                      'This will remove this item from all menus',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    confirmArgs: DConfirmDialogConfirmArgs(
                      buttonStyle: ElevatedButton.styleFrom(
                        primary: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                );
                if (result != null && result) {
                  // ignore: use_build_context_synchronously
                  await context.read<DeleteMenuItemCubit>().delete(
                        item: item,
                        categories: categories,
                        modifierGroups: modifierGroups,
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
