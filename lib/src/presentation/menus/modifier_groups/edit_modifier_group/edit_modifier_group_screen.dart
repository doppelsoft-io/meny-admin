import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/src/utils/utils.dart';
import 'package:meny_core/meny_core.dart';

enum MaxItemChoice {
  exactly,
  upTo,
}

extension MaxItemChoiceX on MaxItemChoice {
  String get name {
    switch (this) {
      case MaxItemChoice.exactly:
        return 'Exactly';
      case MaxItemChoice.upTo:
        return 'Up to';
    }
  }
}

class EditModifierGroupScreenParams {
  EditModifierGroupScreenParams({
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.quantityConstraintsRequiredMaxItemsController,
    required this.quantityConstraintsOptionalMaxItemsController,
    required this.maxItemChoice,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController quantityConstraintsRequiredMaxItemsController;
  final TextEditingController quantityConstraintsOptionalMaxItemsController;
  final ValueNotifier<MaxItemChoice> maxItemChoice;

  void seed({
    String name = '',
    String description = '',
    String price = '',
    String requiredMaxItems = '',
    String optionalMaxItems = '',
  }) {
    TextEditingControllerHelper.setText(nameController, name);
    TextEditingControllerHelper.setText(descriptionController, description);
    TextEditingControllerHelper.setText(priceController, price);
    TextEditingControllerHelper.setText(
      quantityConstraintsRequiredMaxItemsController,
      requiredMaxItems,
    );
    TextEditingControllerHelper.setText(
      quantityConstraintsOptionalMaxItemsController,
      optionalMaxItems,
    );
  }
}

class EditModifierGroupScreen extends StatelessWidget {
  const EditModifierGroupScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  static const String routeName = 'edit-modifier-group';

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditModifierGroupCubit>(
          create: (context) => EditModifierGroupCubit(
            storeCubit: context.read<StoreCubit>(),
            modifierGroupId: id,
          )..loadItem(id: id),
        ),
        BlocProvider<ModifierGroupItemsCubit>(
          create: (context) => ModifierGroupItemsCubit(
            storeCubit: context.read<StoreCubit>(),
          ),
        ),
        BlocProvider<DeleteModifierGroupCubit>(
          create: (context) => DeleteModifierGroupCubit(
            storeCubit: context.read<StoreCubit>(),
          ),
        ),
      ],
      child: const _EditModifierGroupScreen(),
    );
  }
}

class _EditModifierGroupScreen extends HookWidget {
  const _EditModifierGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editModifierGroupState =
        context.watch<EditModifierGroupCubit>().state;
    final modifierGroupItemsState =
        context.watch<ModifierGroupItemsCubit>().state;
    final deleteModifierGroupState =
        context.watch<DeleteModifierGroupCubit>().state;

    final params = EditModifierGroupScreenParams(
      nameController:
          useTextEditingController(text: editModifierGroupState.group.name),
      descriptionController: useTextEditingController(),
      priceController: useTextEditingController(),
      quantityConstraintsRequiredMaxItemsController:
          useTextEditingController(text: '1'),
      quantityConstraintsOptionalMaxItemsController:
          useTextEditingController(text: '1'),
      maxItemChoice: useState(MaxItemChoice.exactly),
    );

    useValueListenable(params.maxItemChoice);
    useValueListenable(params.quantityConstraintsRequiredMaxItemsController);
    useValueListenable(params.quantityConstraintsOptionalMaxItemsController);

    useEffect(
      () {
        if (params.quantityConstraintsRequiredMaxItemsController.text.isEmpty) {
          return;
        }
        if (params.quantityConstraintsOptionalMaxItemsController.text.isEmpty) {
          return;
        }
        QuantityConstraintRules updatedQuantityConstraints;
        final quantityConstraints =
            editModifierGroupState.group.quantityConstraints;

        final minPermittedOptional = quantityConstraints.minPermittedOptional;
        if (minPermittedOptional) {
          final maxPermitted = num.parse(
            params.quantityConstraintsOptionalMaxItemsController.text,
          ).toInt();
          updatedQuantityConstraints = quantityConstraints.copyWith(
            minPermitted: quantityConstraints.minPermitted ?? 1,
            maxPermitted: maxPermitted,
          );
        } else {
          int minPermitted;
          int maxPermitted;
          final parsed = num.parse(
            params.quantityConstraintsRequiredMaxItemsController.text,
          ).toInt();
          switch (params.maxItemChoice.value) {
            case MaxItemChoice.exactly:
              minPermitted = parsed;
              maxPermitted = parsed;
              break;
            case MaxItemChoice.upTo:
              minPermitted = 1;
              maxPermitted = parsed;
          }
          updatedQuantityConstraints = quantityConstraints.copyWith(
            minPermitted: minPermitted,
            maxPermitted: maxPermitted,
          );
        }

        context.read<EditModifierGroupCubit>().updateQuantityConstraints(
              updatedQuantityConstraints,
            );
        return null;
      },
      [
        editModifierGroupState.group.quantityConstraints.minPermittedOptional,
        params.maxItemChoice.value,
        params.quantityConstraintsRequiredMaxItemsController.value,
        params.quantityConstraintsOptionalMaxItemsController.value,
      ],
    );

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: BlocConsumer<EditModifierGroupCubit, EditModifierGroupState>(
        listenWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
        listener: (context, editModifierGroupState) {
          editModifierGroupState.maybeWhen(
            success: (group) {
              Locator.instance<NavigatorHelper>().goToModifierGroups();
              Locator.instance<ToastService>().init(
                DSToast.notification(
                  text: 'Your modifier group ${group.name} has been saved',
                ),
              );
            },
            error: (category, exception) {
              DialogService.showErrorDialog(
                context: context,
                failure: CustomException(message: exception.toString()),
              );
            },
            loaded: (group) {
              _setInitialValues(context, params);

              context
                  .read<ModifierGroupItemsCubit>()
                  .load(modifierGroupId: editModifierGroupState.group.id!);
            },
            orElse: () {},
          );
        },
        builder: (context, editModifierGroupState) {
          return editModifierGroupState.maybeWhen(
            orElse: SizedBox.shrink,
            loading: (_) => ScaffoldBuilder.loading(),
            loaded: (group) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: DSBackButton(
                    onPressed: () => Locator.instance<NavigatorHelper>()
                        .goToModifierGroups(),
                  ),
                  title: const DSText(
                    'Edit Modifier Group',
                    theme: DSTextThemeData.h3(),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(8),
                    child: Visibility(
                      visible: editModifierGroupState.maybeWhen(
                            orElse: () => false,
                            updating: (_) => true,
                          ) ||
                          deleteModifierGroupState.maybeWhen(
                            orElse: () => false,
                            deleting: () => true,
                          ),
                      child: const LinearProgressIndicator(),
                    ),
                  ),
                  actions: [
                    Center(child: _DeleteModifierGroupButton(group: group)),
                    DSHorizontalSpacing.smallest(),
                    Center(
                      child: DSButton(
                        onPressed: () {
                          final isValid = EditModifierGroupScreen
                              ._formKey.currentState!
                              .validate();

                          if (!isValid) return;

                          context.read<EditModifierGroupCubit>().update(
                                group.copyWith(
                                  name: params.nameController.text,
                                ),
                              );
                        },
                        text: 'Save',
                      ),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(DSSpacing.sm),
                  child: Form(
                    key: EditModifierGroupScreen._formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageSection(
                          title: 'Name',
                          child: DSTextFormField(
                            args: DSTextFormFieldArgs(
                              autofocus: true,
                              controller: params.nameController,
                              decoration: const InputDecoration(
                                hintText: 'Enter a name',
                              ),
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              validator: (value) =>
                                  FormValidatorHelper.validateExists(
                                value,
                                message:
                                    'Please enter a name for your modifier group',
                              ),
                              onFieldSubmitted: (name) {
                                final isValid = EditModifierGroupScreen
                                    ._formKey.currentState!
                                    .validate();

                                if (!isValid) return;

                                context.read<EditModifierGroupCubit>().update(
                                      group.copyWith(
                                        name: params.nameController.text,
                                      ),
                                    );
                              },
                            ),
                          ),
                        ),
                        PageSection(
                          title: 'Items',
                          child: TagSelector<MenuItemModel>(
                            context: context,
                            title: 'Select a menu item',
                            initialItems: modifierGroupItemsState.items,
                            fetchSuggestions: () async {
                              final storeId =
                                  context.read<StoreCubit>().state.store.id!;
                              return Locator.instance<MenuItemRepository>()
                                  .getAll(
                                    storeId: storeId,
                                    orderBy: const OrderBy(),
                                  )
                                  .first;
                            },
                            suggestionConfigurationBuilder: (_, item) =>
                                SuggestionConfiguration(
                              title: item.name,
                            ),
                            emptyBuilder: (context) {
                              return const DSText(
                                'No menus to select',
                              );
                            },
                            onSelect: (_, item) {
                              context
                                  .read<ModifierGroupItemsCubit>()
                                  .createModifierGroupItem(
                                    item: item,
                                    modifierGroup: group,
                                  );
                            },
                            onRemove: (_, item) {
                              context
                                  .read<ModifierGroupItemsCubit>()
                                  .removeMenuItemModifierGroup(
                                    item: item,
                                    modifierGroup: group,
                                  );
                            },
                            tagConfigurationBuilder: (_, item) {
                              return TagConfiguration(
                                title: item.name,
                                removable: true,
                              );
                            },
                            tagBuilder: (_, configuration, item) {
                              final modifierGroupMenuItem =
                                  modifierGroupItemsState.modifierGroupItems
                                      .firstWhere(
                                (e) => e.menuItemId == item.id,
                              );
                              return BlocProvider<EditModifierGroupItemCubit>(
                                create: (context) => EditModifierGroupItemCubit(
                                  storeCubit: context.read<StoreCubit>(),
                                )..seed(model: modifierGroupMenuItem),
                                child: _ModifierGroupItem(
                                  modifierGroup: editModifierGroupState.group,
                                  menuItem: item,
                                  modifierGroupItem: modifierGroupMenuItem,
                                  // item: item,
                                ),
                              );
                            },
                            textFieldConfiguration:
                                const TextFieldConfiguration(
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                hintText: 'Add item',
                              ),
                            ),
                          ),
                        ),
                        PageSection(
                          title: 'Rules',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Control how customers can select the items in this modifier group',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              DSVerticalSpacing.small(),
                              DSCheckbox(
                                args: DSCheckboxArgs(
                                  title: const Text(
                                    'Require customers to select an item?',
                                  ),
                                  value: !editModifierGroupState.group
                                      .quantityConstraints.minPermittedOptional,
                                  onChanged: (minPermittedOptional) {
                                    if (minPermittedOptional != null) {
                                      final quantityConstraints =
                                          editModifierGroupState
                                              .group.quantityConstraints;
                                      final updatedQuantityConstraints =
                                          quantityConstraints.copyWith(
                                        minPermittedOptional:
                                            !minPermittedOptional,
                                      );
                                      context
                                          .read<EditModifierGroupCubit>()
                                          .updateQuantityConstraints(
                                            updatedQuantityConstraints,
                                          );
                                    }
                                  },
                                ),
                              ),
                              DSVerticalSpacing.small(),
                              if (editModifierGroupState
                                  .group
                                  .quantityConstraints
                                  .minPermittedOptional) ...[
                                Row(
                                  children: [
                                    IntrinsicWidth(
                                      child: DSCheckbox(
                                        args: DSCheckboxArgs(
                                          title: const Text(
                                            "What's the maximum amount of items customers can select?",
                                          ),
                                          value: true,
                                          onChanged: (val) {
                                            final quantityConstraints =
                                                editModifierGroupState
                                                    .group.quantityConstraints;

                                            final updatedQuantityConstraints =
                                                quantityConstraints.copyWith(
                                              minPermittedOptional: false,
                                            );

                                            context
                                                .read<EditModifierGroupCubit>()
                                                .updateQuantityConstraints(
                                                  updatedQuantityConstraints,
                                                );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 100),
                                      child: DSTextFormField(
                                        args: DSTextFormFieldArgs(
                                          controller: params
                                              .quantityConstraintsOptionalMaxItemsController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ] else ...[
                                const Text(
                                  "What's the maximum amount of items customers can select?",
                                ),
                                Row(
                                  children: [
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 200),
                                      child: SizedBox(
                                        height: 60,
                                        child: DSTextFormFieldThemeWrapper(
                                          child: DropdownButtonFormField<
                                              MaxItemChoice>(
                                            value: params.maxItemChoice.value,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            alignment: Alignment.centerLeft,
                                            items: MaxItemChoice.values
                                                .map(
                                                  (e) => DropdownMenuItem<
                                                      MaxItemChoice>(
                                                    value: e,
                                                    child: Text(e.name),
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (v) {
                                              if (v != null) {
                                                params.maxItemChoice.value = v;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 100),
                                      child: DSTextFormField(
                                        args: DSTextFormFieldArgs(
                                          controller: params
                                              .quantityConstraintsRequiredMaxItemsController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
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
      ),
    );
  }

  void _setInitialValues(
    BuildContext context,
    EditModifierGroupScreenParams params,
  ) {
    context.read<EditModifierGroupCubit>().state.maybeWhen(
          loaded: (group) {
            final quantityConstraints = group.quantityConstraints;
            final minPermittedOptional =
                quantityConstraints.minPermittedOptional;

            if (minPermittedOptional) {
              params.seed(
                name: group.name,
                optionalMaxItems:
                    (quantityConstraints.maxPermitted ?? 1).toString(),
                requiredMaxItems: '1',
              );
            } else {
              params.seed(
                name: group.name,
                optionalMaxItems: '1',
                requiredMaxItems:
                    (quantityConstraints.maxPermitted ?? 1).toString(),
              );
            }
          },
          orElse: () {},
        );
  }

  Future<bool> _onWillPop(BuildContext context) {
    final group = context.read<EditModifierGroupCubit>().state.group;
    final modifierGroupItems =
        context.read<ModifierGroupItemsCubit>().state.modifierGroupItems;

    if (group.name.isEmpty) {
      showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Close without saving?'),
            actions: [
              DSButton(
                onPressed: () => Navigator.of(context).pop(true),
                text: 'Yes',
              ),
              DSButton(
                onPressed: () => Navigator.of(context).pop(false),
                text: 'No',
              ),
            ],
          );
        },
      ).then((value) {
        if (value != null && value) {
          context.read<DeleteModifierGroupCubit>().delete(
                modifierGroup: group,
                modifierGroupItems: modifierGroupItems,
              );
          return Future.value(true);
        }
        return Future.value(false);
      });
    }
    return Future.value(true);
  }
}

class _ModifierGroupItem extends HookWidget {
  const _ModifierGroupItem({
    Key? key,
    required this.modifierGroup,
    required this.menuItem,
    required this.modifierGroupItem,
  }) : super(key: key);

  final ModifierGroupModel modifierGroup;
  final MenuItemModel menuItem;
  final ModifierGroupItemModel modifierGroupItem;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final controller = useTextEditingController();
    final priceDebouncer =
        DSDebouncer(delay: const Duration(milliseconds: 300));

    void formatPrice(num price) {
      TextEditingControllerHelper.setText(
        controller,
        price.toCurrency(
          excludeDollarSign: true,
        ),
      );
    }

    useEffect(
      () {
        formatPrice(modifierGroupItem.priceOverride.price / 100);
        focusNode.addListener(() {
          if (!focusNode.hasFocus) {
            final price =
                ((double.tryParse(controller.text) ?? 0) * 100).toInt();
            formatPrice(price / 100);
          }
        });
        return null;
      },
      const [],
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(
        top: 12,
      ),
      padding: const EdgeInsets.only(
        left: 24,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              menuItem.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.all(8),
            child: DSTextFormField(
              args: DSTextFormFieldArgs(
                controller: controller,
                focusNode: focusNode,
                onChanged: (price) {
                  final cents = ((double.tryParse(price) ?? 0) * 100).toInt();
                  final existingPriceOverride = modifierGroupItem.priceOverride;
                  priceDebouncer.run(() {
                    context.read<EditModifierGroupItemCubit>().update(
                          model: modifierGroupItem.copyWith(
                            priceOverride: existingPriceOverride.copyWith(
                              price: cents,
                            ),
                          ),
                        );
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.attach_money,
                    color: Colors.black,
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  ValidatorInputFormatter(
                    editingValidator: DecimalNumberEditingRegexValidator(),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.error,
            ),
            // icon: const Icon(Icons.more_vert),
            onPressed: () {
              showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Delete?'),
                  actions: [
                    DSButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      text: 'Cancel',
                    ),
                    DSHorizontalSpacing.smallest(),
                    DSButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      text: 'Yes',
                    ),
                  ],
                ),
              ).then((result) {
                if (result != null && result) {
                  context
                      .read<ModifierGroupItemsCubit>()
                      .removeMenuItemModifierGroup(
                        item: menuItem,
                        modifierGroup: modifierGroup,
                      );
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

class _DeleteModifierGroupButton extends StatelessWidget {
  const _DeleteModifierGroupButton({
    Key? key,
    required this.group,
  }) : super(key: key);

  final ModifierGroupModel group;

  Future<void> showConfirmationDialog({
    required BuildContext context,
    required ModifierGroupModel group,
    required List<ModifierGroupItemModel> modifierGroupItems,
  }) async {
    final result = await DSConfirmDialog.open<bool>(
      context,
      args: DSConfirmDialogArgs(
        title: 'Delete ${group.name}?',
        content: Text(
          'This will remove this group from all menu items',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        confirmArgs: const DSConfirmDialogConfirmArgs(
          text: 'Delete',
        ),
      ),
    );
    if (result != null && result) {
      // ignore: use_build_context_synchronously
      await context.read<DeleteModifierGroupCubit>().delete(
            modifierGroup: group,
            modifierGroupItems: modifierGroupItems,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteModifierGroupCubit, DeleteModifierGroupState>(
      listener: (context, deleteModifierGroupState) {
        deleteModifierGroupState.maybeWhen(
          success: () {
            Locator.instance<NavigatorHelper>().goToModifierGroups();
            if (group.name.isNotEmpty) {
              Locator.instance<ToastService>().init(
                DSToast.notification(
                  text: 'Your modifier group ${group.name} has been deleted',
                ),
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
      builder: (context, deleteModifierGroupState) {
        final modifierGroupItems =
            context.watch<ModifierGroupItemsCubit>().state.modifierGroupItems;

        return DeleteResourceButton(
          args: DeleteResourceButtonArgs(
            onPressed: deleteModifierGroupState.maybeWhen(
              deleting: () {
                return null;
              },
              orElse: () => () {
                showConfirmationDialog(
                  context: context,
                  group: group,
                  modifierGroupItems: modifierGroupItems,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
