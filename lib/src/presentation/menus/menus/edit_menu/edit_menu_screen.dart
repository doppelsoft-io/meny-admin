import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class EditMenuScreen extends StatelessWidget {
  const EditMenuScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  static const String routeName = 'edit-menu';

  final String id;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditMenuCubit>(
          create: (context) => EditMenuCubit(
            storeCubit: context.read<StoreCubit>(),
            menuId: id,
          ),
        ),
        BlocProvider<DeleteMenuCubit>(
          create: (context) => DeleteMenuCubit(
            storeCubit: context.read<StoreCubit>(),
          ),
        ),
      ],
      child: const _EditMenuScreen(),
    );
  }
}

class _EditMenuScreen extends HookWidget {
  const _EditMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeState = context.watch<StoreCubit>().state;
    final editMenuState = context.watch<EditMenuCubit>().state;
    final deleteMenuState = context.watch<DeleteMenuCubit>().state;

    final controller = useTextEditingController(text: editMenuState.menu.name);

    return storeState.maybeWhen(
      orElse: DSLoadingIndicator.new,
      loaded: (store) {
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
                success: (menu) {
                  Locator.instance<ToastService>().showNotification(
                    Text('Your menu ${menu.name} has been saved'),
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
                      backgroundColor: Colors.white,
                      leading: const DSBackButton(),
                      title: const DSText(
                        'Edit Menu',
                        theme: DSTextThemeData.h3(),
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
                        DeleteMenuButton(
                          onDelete: (_) async {
                            final result = await DSConfirmDialog.open<bool>(
                              context,
                              args: DSConfirmDialogArgs(
                                title: 'Delete ${editMenuState.menu.name}?',
                                confirmArgs: const DSConfirmDialogConfirmArgs(
                                  text: 'Delete',
                                ),
                                content: Text(
                                  'This will delete this menu. No categories or items will be affected.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            );
                            if (result != null && result) {
                              // ignore: use_build_context_synchronously
                              await context
                                  .read<DeleteMenuCubit>()
                                  .delete(menu: editMenuState.menu);
                            }
                          },
                        ),
                        DSHorizontalSpacing.smallest(),
                        Center(
                          child: DSButton(
                            // theme: DSButtonThemeData.,
                            text: 'Save',
                            onPressed: () {
                              final isValid = EditMenuScreen
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
                          ),
                        ),
                        DSHorizontalSpacing.medium(),
                      ],
                    ),
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.all(DSSpacing.sm),
                      child: Form(
                        key: EditMenuScreen._formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PageSection(
                              title: 'Name',
                              child: DSTextFormField(
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
                                        'Please enter a name for your menu',
                                  ),
                                  onFieldSubmitted: (text) {
                                    final isValid = EditMenuScreen
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
      },
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
          return DSConfirmDialog(
            args: DSConfirmDialogArgs(
              title: 'Close without saving?',
              content: const SizedBox.shrink(),
              cancelArgs: DSConfirmDialogCancelArgs(
                text: 'No',
                onPressed: () => Navigator.of(context).pop(false),
              ),
              confirmArgs: DSConfirmDialogConfirmArgs(
                text: 'Yes',
                onPressed: () => Navigator.of(context).pop(true),
                // buttonStyle: ElevatedButton.styleFrom(
                //   primary: Theme.of(context).errorColor,
                // ),
              ),
            ),
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
