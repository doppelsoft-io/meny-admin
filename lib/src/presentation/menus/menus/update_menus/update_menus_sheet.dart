import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/presentation/sheet_args.dart';
import 'package:meny/src/services/services.dart';

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
              controller..text = menu.name;
            },
            success: (_) {
              ToastService.showNotification(const Text('Menu updated'));
              Navigator.pop(context);
            },
            error: (_, exception) {
              DialogService.showErrorDialog(
                context: context,
                failure: Failure(message: exception.toString()),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, editMenuState) {
          return editMenuState.maybeWhen(
            loading: (_) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: true,
                centerTitle: false,
                iconTheme: const IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
              ),
              body: Center(child: CircularProgressIndicator()),
            ),
            error: (_, exception) {
              return Scaffold(
                appBar: AppBar(automaticallyImplyLeading: true),
                body: ErrorDisplay(
                  failure: Failure(
                    message: exception.toString(),
                  ),
                ),
              );
            },
            orElse: () {
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
                    const SizedBox(width: 12.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => context.read<EditMenuCubit>()
                          ..update(editMenuState.menu.copyWith(
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
                  padding: EdgeInsets.all(Spacing.pageSpacing),
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

  Future<bool> _onWillPop({
    required BuildContext context,
    required MenuModel menu,
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
}

class UpdateMenusSheet extends StatelessWidget {
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
              create: (context) => EditMenuCubit(
                storeCubit: context.read<StoreCubit>(),
              )..loadMenu(menu: args.resource as MenuModel),
            ),
            BlocProvider<DeleteMenuCubit>(
              create: (context) => DeleteMenuCubit(),
            ),
          ],
          child: _UpdateMenusSheet(),
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

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
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
        deleteMenuState.maybeWhen(
          success: () {
            Navigator.of(context).pop();
            ToastService.toast('Menu deleted');
          },
          orElse: () {},
        );
      },
      builder: (context, deleteMenuState) {
        return OutlinedButton(
          onPressed: deleteMenuState.maybeWhen(
            deleting: () {},
            orElse: () => () => showConfirmationDialog(
                  context: context,
                  menu: menu,
                ),
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
  }
}
