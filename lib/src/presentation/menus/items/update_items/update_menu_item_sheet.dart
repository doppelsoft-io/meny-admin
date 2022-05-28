import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/constants/spacing.dart';
import 'package:meny_admin/src/data/categories/categories.dart';
import 'package:meny_admin/src/data/category_menu_items/category_menu_items.dart';
import 'package:meny_admin/src/data/menu_items/menu_items.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/items/image_upload/image_display_card.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/presentation/sheet_args.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/src/utils/utils.dart';
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
    final categoryMenuItemsState =
        context.watch<CategoryMenuItemsCubit>().state;
    final deleteMenuItemState = context.watch<DeleteMenuItemCubit>().state;
    final imageUploadState = context.watch<ImageUploadCubit>().state;
    final item = editMenuItemState.item;
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final priceController = useTextEditingController();

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
            },
            orElse: () {},
          );
        },
        builder: (context, editMenuItemState) {
          return editMenuItemState.maybeWhen(
            loading: (_) => ScaffoldBuilder.loading(),
            error: (_, exception) =>
                ScaffoldBuilder.error(exception: exception),
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
                        'Edit Menu Item',
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
                        const SizedBox(width: 12),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              final now = DateTime.now();
                              context.read<EditMenuItemCubit>().update(
                                    item.copyWith(
                                      name: nameController.text,
                                      priceInfo: PriceInfo(
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
                        const SizedBox(width: 24),
                      ],
                    ),
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.all(Spacing.pageSpacing),
                      child: Column(
                        children: [
                          Row(),
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
                          const SizedBox(height: 24),
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
                          const SizedBox(height: 24),
                          BlocConsumer<ImageUploadCubit, ImageUploadState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                picked: (file, url) => context
                                    .read<ImageUploadCubit>()
                                    .upload(item: item),
                                orElse: () {},
                              );
                            },
                            builder: (context, state) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImageDisplayCard(
                                    url: state.url,
                                    processing: state.maybeWhen(
                                      uploading: (_, __) => true,
                                      orElse: () => false,
                                    ),
                                    onTap: () =>
                                        context.read<ImageUploadCubit>().pick(),
                                    emptyBuilder: () => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Photos of your menu items can help customers when deciding to order and can increase sales.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 24),
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
                          const SizedBox(height: 24),
                          TagSelector<CategoryModel>(
                            initialItems: categoryMenuItemsState.categories,
                            fetchSuggestions: () {
                              final storeId =
                                  context.read<StoreCubit>().state.store.id!;

                              return Locator.instance<CategoryRepository>()
                                  .getAll(storeId: storeId)
                                  .first;
                            },
                            suggestionConfigurationBuilder: (_, category) =>
                                SuggestionConfiguration(title: category.name),
                            emptyBuilder: (context) => const Padding(
                              padding: EdgeInsets.all(20),
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
            priceController.text = (item.priceInfo.price / 100).toCurrency();
            if (item.imageUrl != null) {
              context.read<ImageUploadCubit>().seed(url: item.imageUrl!);
            }
          },
          orElse: () {},
        );
  }

  Future<bool> _onWillPop({
    required BuildContext context,
    required MenuItemModel item,
    required List<CategoryModel> categories,
  }) {
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
  const _DeleteMenuItemButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MenuItemModel item;

  void showConfirmationDialog({
    required BuildContext context,
    required MenuItemModel item,
    required List<CategoryModel> categories,
  }) {
    showDialog<bool>(
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
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text('NO'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).errorColor),
              ),
              child: const Text('YES'),
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
                deleting: () {
                  return null;
                },
                orElse: () => () => showConfirmationDialog(
                      context: context,
                      item: item,
                      categories: categoryMenuItemsState.categories,
                    ),
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.grey[100],
              ),
              child: Text(
                'Delete',
                style: TextStyle(color: Theme.of(context).errorColor),
              ),
            );
          },
        );
      },
    );
  }
}
