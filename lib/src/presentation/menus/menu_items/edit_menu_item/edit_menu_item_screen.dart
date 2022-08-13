import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/themes.dart';
import 'package:meny_core/meny_core.dart';

class EditMenuItemSheetParams {
  EditMenuItemSheetParams({
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.taxRateController,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController taxRateController;
}

class EditMenuItemScreen extends StatelessWidget {
  const EditMenuItemScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  static const String routeName = 'edit-menu-item';

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditMenuItemCubit>(
          create: (context) => EditMenuItemCubit(
            itemId: id,
            storeCubit: context.read<StoreCubit>(),
          ),
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
      child: const _EditMenuItemScreen(),
    );
  }
}

class _EditMenuItemScreen extends HookWidget {
  const _EditMenuItemScreen({
    Key? key,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    final storeState = context.watch<StoreCubit>().state;
    final editMenuItemState = context.watch<EditMenuItemCubit>().state;
    final deleteMenuItemState = context.watch<DeleteMenuItemCubit>().state;
    final imageUploadState = context.watch<ImageUploadCubit>().state;
    final item = editMenuItemState.item;
    final params = EditMenuItemSheetParams(
      nameController: useTextEditingController(),
      descriptionController: useTextEditingController(),
      priceController: useTextEditingController(),
      taxRateController: useTextEditingController(),
    );

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: BlocConsumer<EditMenuItemCubit, EditMenuItemState>(
        listener: (context, editMenuItemState) {
          editMenuItemState.maybeWhen(
            success: (item) {
              Navigator.pop(context);
              Locator.instance<ToastService>().showNotification(
                Text('Your item ${item.name} has been saved'),
              );
            },
            error: (item, exception) {
              if (exception is AnonymousUserException) {
                GoRouter.of(context).go('/');
              } else {
                DialogService.showErrorDialog(
                  context: context,
                  failure: CustomException(message: exception.toString()),
                );
              }
            },
            loaded: (item) {
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
            orElse: () {
              return _ItemForm(
                item: item,
                params: params,
              );
            },
          );
        },
      ),
    );
  }
}

class _ItemForm extends HookWidget {
  const _ItemForm({
    Key? key,
    required this.item,
    required this.params,
  }) : super(key: key);

  final MenuItemModel item;
  final EditMenuItemSheetParams params;

  @override
  Widget build(BuildContext context) {
    final editMenuItemState = context.watch<EditMenuItemCubit>().state;
    final deleteMenuItemState = context.watch<DeleteMenuItemCubit>().state;
    final imageUploadState = context.watch<ImageUploadCubit>().state;

    useEffect(
      () {
        context.read<EditMenuItemCubit>().state.maybeWhen(
              loaded: (item) {
                params.nameController.text = item.name;
                params.descriptionController.text = item.description ?? '';
                params.priceController.text = (item.priceInfo.price / 100)
                    .toCurrency(excludeDollarSign: true);
                if (item.imageUrl != null) {
                  context.read<ImageUploadCubit>().seed(url: item.imageUrl!);
                }
              },
              orElse: () {},
            );
        return null;
      },
      const [],
    );

    void save() {
      final isValid = EditMenuItemScreen._formKey.currentState!.validate();
      if (!isValid) return;

      final now = DateTime.now();

      context.read<EditMenuItemCubit>().update(
            item.copyWith(
              name: params.nameController.text,
              priceInfo: PriceInfoModel(
                price: ((double.tryParse(
                              params.priceController.text,
                            ) ??
                            0) *
                        100)
                    .toInt(),
              ),
              description: params.descriptionController.text,
              updatedAt: now,
              imageUrl:
                  imageUploadState.url.isNotEmpty ? imageUploadState.url : null,
            ),
          );
    }

    return BlocBuilder<CategoryMenuItemsCubit, CategoryMenuItemsState>(
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
              DSHorizontalSpacing.small(),
              Center(
                child: ElevatedButton(
                  onPressed: save,
                  child: const Text('Save'),
                ),
              ),
              DSHorizontalSpacing.medium(),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(DSSpacing.medium),
            child: Form(
              key: EditMenuItemScreen._formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageSection(
                    title: 'Name',
                    child: MenuItemNameField(
                      controller: params.nameController,
                    ),
                  ),
                  PageSection(
                    title: 'Description',
                    caption: '(Optional)',
                    child: MenuItemDescriptionField(
                      controller: params.descriptionController,
                    ),
                  ),
                  PageSection(
                    title: 'Sell as a stand-alone item?',
                    onInfoTapped: (_) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return SimpleDialog(
                            title: DSText.headline6(
                              'Sell as a stand-alone item?',
                            ),
                            contentPadding: const EdgeInsets.all(24),
                            children: [
                              DSText.bodyText1(
                                'This determines whether this menu item should appear to customers as a sellable item by itself on the menu.',
                              ),
                              const SizedBox(height: 12),
                              DSText.bodyText1(
                                'If you are creating a menu item to be used in a modifier group, set this property to "No".',
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        IntrinsicWidth(
                          child: RadioListTile(
                            value: true,
                            groupValue: item.type == MenuItemType.item,
                            onChanged: (v) {
                              final updatedItem = item.copyWith(
                                type: MenuItemType.item,
                              );
                              context.read<EditMenuItemCubit>().update(
                                    updatedItem,
                                    save: false,
                                  );
                            },
                            title: const Text(
                              'Yes',
                            ),
                          ),
                        ),
                        DSHorizontalSpacing.large(),
                        IntrinsicWidth(
                          child: RadioListTile(
                            value: false,
                            groupValue: item.type == MenuItemType.item,
                            onChanged: (v) {
                              final updatedItem = item.copyWith(
                                type: MenuItemType.modifierGroup,
                              );
                              context.read<EditMenuItemCubit>().update(
                                    updatedItem,
                                    save: false,
                                  );
                            },
                            title: const Text(
                              'No',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PageSection(
                    title: 'Photo',
                    caption: '(Optional)',
                    subtitle:
                        'Photos of your menu items can help customers when deciding to order and can increase sales.',
                    child: _ImageUpload(item: item),
                  ),
                  PageSection(
                    title: 'Default Price',
                    child: MenuItemPriceField(
                      controller: params.priceController,
                    ),
                  ),
                  PageSection(
                    title: 'Tax Rate',
                    child: MenuItemTaxInfoField(
                      controller: params.taxRateController,
                    ),
                  ),
                  const _SuspensionRules(),
                  PageSection(
                    title: 'Categories',
                    subtitle:
                        'Select which categories this item will appear in',
                    child: _CategorySelector(item: item),
                  ),
                  if (item.type == MenuItemType.item) ...[
                    PageSection(
                      title: 'Modifier Groups',
                      child: _ModifierGroupSelector(item: item),
                    ),
                  ],
                  PageSection(
                    title: 'Dietary Labels',
                    child: _DietaryLabels(item: item),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        );
      },
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
              Locator.instance<ToastService>().showNotification(
                Text('Your item ${item.name} has been deleted'),
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
                final result = await DSConfirmDialog.open<bool>(
                  context,
                  args: DSConfirmDialogArgs(
                    // buttonStyle: ElevatedButton.styleFrom(
                    //   primary: Theme.of(context).errorColor,
                    // ),
                    title: 'Delete ${item.name}?',
                    content: Text(
                      'This will remove this item from all menus',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    confirmArgs: DSConfirmDialogConfirmArgs(),
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
            DSImageUploadCard(
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
          ],
        );
      },
    );
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
        DSDebouncer(delay: const Duration(milliseconds: 300));

    return itemState.maybeWhen(
      loaded: (item) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 225,
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                enableFeedback: true,
                title: const Text('Item out of stock?'),
                value: item.suspensionRules != null,
                onChanged: (outOfStock) {
                  if (outOfStock) {
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
                  } else {
                    final updatedItem = item.copyWith(suspensionRules: null);
                    suspensionReasonController.clear();
                    context.read<EditMenuItemCubit>().update(
                          updatedItem,
                          save: false,
                        );
                  }
                },
                visualDensity: VisualDensity.compact,
              ),
            ),
            if (item.suspensionRules != null) ...[
              DSVerticalSpacing.small(),
              DSTextFormField(
                theme: Themes.theme.textFormFieldThemeData,
                args: DSTextFormFieldArgs(
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
            ],
            DSVerticalSpacing.large(),
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
      context: context,
      title: 'Select a category',
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
      emptyBuilder: (context) => DSText.bodyText1(
        'No categories to select.',
        textAlign: TextAlign.center,
      ),
      onSelect: (_, category) {
        context.read<CategoryMenuItemsCubit>().createCategoryMenuItem(
              category: category,
              item: item,
            );
      },
      onRemove: (_, category) =>
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
      context: context,
      title: 'Select a modifier group',
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
        return DSText.bodyText1(
          'No modifier groups',
          textAlign: TextAlign.center,
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

class _DietaryLabels extends StatelessWidget {
  const _DietaryLabels({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MenuItemModel item;

  IconData _getIcon(DietaryLabel label) {
    switch (label) {
      case DietaryLabel.vegan:
        return FontAwesomeIcons.egg;
      case DietaryLabel.vegetarian:
        return FontAwesomeIcons.leaf;
      case DietaryLabel.glutenFree:
        return FontAwesomeIcons.wheatAwn;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: DietaryLabel.values
          .map(
            (e) => Builder(
              builder: (context) {
                final colorScheme = Theme.of(context).colorScheme;
                final dietaryLabels = item.dietaryLabels ?? [];
                final isSelected = dietaryLabels.contains(e);

                return GestureDetector(
                  onTap: () {
                    if (isSelected) {
                      final updatedLabels = List<DietaryLabel>.from(
                        dietaryLabels,
                      )..removeWhere((l) => l == e);

                      final updatedItem = item.copyWith(
                        dietaryLabels: updatedLabels,
                      );
                      context.read<EditMenuItemCubit>().update(
                            updatedItem,
                            save: false,
                          );
                    } else {
                      final updatedLabels = List<DietaryLabel>.from(
                        dietaryLabels,
                      )..add(e);

                      final updatedItem = item.copyWith(
                        dietaryLabels: updatedLabels,
                      );
                      context.read<EditMenuItemCubit>().update(
                            updatedItem,
                            save: false,
                          );
                    }
                  },
                  child: Chip(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    backgroundColor: isSelected
                        ? colorScheme.primary
                        : colorScheme.onBackground,
                    label: Text(e.stringify()),
                    avatar: Icon(
                      _getIcon(e),
                      color: isSelected ? colorScheme.onPrimary : Colors.black,
                      size: 16,
                    ),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                          fontWeight: FontWeight.w100,
                          color:
                              isSelected ? colorScheme.onPrimary : Colors.black,
                        ),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }
}
