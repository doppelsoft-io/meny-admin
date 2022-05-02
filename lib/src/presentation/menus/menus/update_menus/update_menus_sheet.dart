import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/presentation/sheet_args.dart';
import 'package:meny/src/services/services.dart';
import 'package:meny/src/constants/spacing.dart';

class UpdateMenusSheet extends HookWidget {
  final MenuModel menu;

  const UpdateMenusSheet({
    Key? key,
    required this.menu,
  }) : super(key: key);

  static const String routeName = '/updateMenusSheet';

  static Route route(SheetArgs args) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EditMenuCubit>(
              create: (context) =>
                  EditMenuCubit()..loadMenu(menu: args.resource as MenuModel),
            ),
            BlocProvider<DeleteMenuCubit>(
              create: (context) => DeleteMenuCubit(),
            ),
          ],
          child: BlocConsumer<EditMenuCubit, EditMenuState>(
            listener: (context, state) {
              if (state.isSuccess) {
                ToastService.showNotification(const Text('Menu updated'));
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
              if (state.menu != null) {
                final menu = state.menu;
                return UpdateMenusSheet(menu: menu!);
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

  static open({
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

  Future<bool> _onWillPop({
    required BuildContext context,
  }) {
    if (menu.name.isEmpty) {
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
          context.read<DeleteMenuCubit>().delete(menu: menu);
          return Future.value(false);
        }
        return Future.value(value);
      });
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: menu.name);

    return WillPopScope(
      onWillPop: () => _onWillPop(context: context),
      child: BlocBuilder<EditMenuCubit, EditMenuState>(
        builder: (context, editMenuState) {
          return BlocBuilder<DeleteMenuCubit, DeleteMenuState>(
            builder: (context, deleteMenuState) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  automaticallyImplyLeading: true,
                  iconTheme: const IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: const Text(
                    'Edit Menu',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(8.0),
                    child: Visibility(
                      visible: editMenuState.isUpdating ||
                          deleteMenuState.isDeleting,
                      child: const LinearProgressIndicator(),
                    ),
                  ),
                  actions: [
                    Center(child: _DeleteMenuButton(menu: menu)),
                    const SizedBox(width: 12.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => context.read<EditMenuCubit>()
                          ..update(menu.copyWith(
                            name: controller.text,
                            updatedAt: DateTime.now(),
                          )),
                        child: const Text('Save'),
                      ),
                    ),
                    const SizedBox(width: 24.0),
                  ],
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(Spacing.pageSpacing),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller,
                        autofocus: true,
                        showCursor: true,
                        cursorWidth: 3,
                        cursorHeight: Theme.of(context)
                            .inputDecorationTheme
                            .labelStyle!
                            .fontSize,
                        decoration: const InputDecoration(
                          hintText: 'Enter a name',
                          labelText: 'Name',
                        ),
                        style:
                            Theme.of(context).inputDecorationTheme.labelStyle,
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
  }
}

class _DeleteMenuButton extends StatelessWidget {
  final MenuModel menu;

  const _DeleteMenuButton({
    Key? key,
    required this.menu,
  }) : super(key: key);

  void showConfirmationDialog({
    required BuildContext context,
    required MenuModel menu,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete ${menu.name}?'),
          content: Text(
            'This will delete this menu. No categories or items will be affected.',
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
        context.read<DeleteMenuCubit>().delete(menu: menu);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteMenuCubit, DeleteMenuState>(
      listener: (context, deleteMenuState) {
        if (deleteMenuState.status == DeleteMenuStatus.success) {
          Navigator.of(context).pop();
          ToastService.showNotification(const Text('Menu deleted'));
        }
      },
      builder: (context, deleteMenuState) {
        return OutlinedButton(
          onPressed: deleteMenuState.isDeleting
              ? null
              : () => showConfirmationDialog(context: context, menu: menu),
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
