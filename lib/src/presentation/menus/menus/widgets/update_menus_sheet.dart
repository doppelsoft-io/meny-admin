import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/menus/menus.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/resources/widgets/delete_resource_button.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/presentation/sheet_args.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/themes.dart';
import 'package:meny_core/meny_core.dart';

class UpdateMenusSheet extends StatelessWidget {
  const UpdateMenusSheet({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final MenuModel menu;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const String routeName = '/updateMenusSheet';

  static Route route(SheetArgs? args) {
    return MaterialPageRoute<Widget>(
      fullscreenDialog: true,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EditMenuCubit>(
              create: (context) => EditMenuCubit(
                storeCubit: context.read<StoreCubit>(),
              )..loadMenu(menu: args!.resource as MenuModel),
            ),
            BlocProvider<DeleteMenuCubit>(
              create: (context) => DeleteMenuCubit(
                storeCubit: context.read<StoreCubit>(),
              ),
            ),
          ],
          child: const _UpdateMenusSheet(),
        );
      },
    );
  }

  static Future<Object?> open({
    required BuildContext context,
    required MenuModel menu,
  }) {
    return Navigator.of(context).pushNamed(
      UpdateMenusSheet.routeName,
      arguments: SheetArgs(
        resource: menu,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _UpdateMenusSheet();
  }
}

class _UpdateMenusSheet extends HookWidget {
  const _UpdateMenusSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editMenuState = context.watch<EditMenuCubit>().state;
    final deleteMenuState = context.watch<DeleteMenuCubit>().state;

    final controller = useTextEditingController(text: editMenuState.menu.name);

    return WillPopScope(
      onWillPop: () => _onWillPop(
        context: context,
        menu: editMenuState.menu,
      ),
      child: BlocConsumer<EditMenuCubit, EditMenuState>(
        listener: (context, editMenuState) {
          editMenuState.maybeWhen(
            loaded: (menu) {
              controller.text = menu.name;
            },
            success: (_) {
              Locator.instance<ToastService>().showNotification(
                const Text('Menu updated'),
              );
              Navigator.pop(context);
            },
            error: (_, exception) {
              DialogService.showErrorDialog(
                context: context,
                failure: CustomException(message: exception.toString()),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, editMenuState) {
          return editMenuState.maybeWhen(
            loading: (_) => ScaffoldBuilder.loading(),
            orElse: () {
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: const Text(
                    'Edit Menu',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(8),
                    child: Visibility(
                      visible: editMenuState.maybeWhen(
                            orElse: () => false,
                            updating: (_) => true,
                          ) ||
                          deleteMenuState.maybeWhen(
                            orElse: () => false,
                            deleting: () => true,
                          ),
                      child: const LinearProgressIndicator(),
                    ),
                  ),
                  actions: [
                    Center(child: _DeleteMenuButton(menu: editMenuState.menu)),
                    HorizontalSpacing.small(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final isValid = UpdateMenusSheet
                              ._formKey.currentState!
                              .validate();

                          if (!isValid) return;

                          context.read<EditMenuCubit>().update(
                                editMenuState.menu.copyWith(
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
                  padding: const EdgeInsets.all(Spacing.pageSpacing),
                  child: Form(
                    key: UpdateMenusSheet._formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageSection(
                          title: 'Name',
                          child: DTextFormField(
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
                                message: 'Please enter a name for your menu',
                              ),
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
      ),
    );
  }

  Future<bool> _onWillPop({
    required BuildContext context,
    required MenuModel menu,
  }) {
    if (menu.name.isEmpty) {
      return showDialog<bool>(
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
          context.read<DeleteMenuCubit>().delete(menu: menu);
          return Future.value(false);
        }
        return Future.value(value);
      });
    }
    return Future.value(true);
  }
}

class _DeleteMenuButton extends StatelessWidget {
  const _DeleteMenuButton({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteMenuCubit, DeleteMenuState>(
      listener: (context, deleteMenuState) {
        deleteMenuState.maybeWhen(
          success: () {
            Navigator.of(context).pop();
            ToastService.toast('Menu deleted');
          },
          error: (exception) {
            Locator.instance<ToastService>().showNotification(
              Text(exception.toString()),
              ToastType.error,
            );
          },
          orElse: () {},
        );
      },
      builder: (context, deleteMenuState) {
        return DeleteResourceButton(
          args: DeleteResourceButtonArgs(
            onPressed: deleteMenuState.maybeWhen(
              deleting: () {
                return null;
              },
              orElse: () => () async {
                final result = await DConfirmDialog.open<bool>(
                  context,
                  args: DConfirmDialogArgs(
                    title: Text('Delete ${menu.name}?'),
                    content: Text(
                      'This will delete this menu. No categories or items will be affected.',
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
                  await context.read<DeleteMenuCubit>().delete(menu: menu);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
