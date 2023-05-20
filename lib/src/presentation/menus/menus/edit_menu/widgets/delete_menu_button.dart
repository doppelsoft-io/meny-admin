import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';

class DeleteMenuButton extends StatelessWidget {
  const DeleteMenuButton({
    Key? key,
    required this.onDelete,
  }) : super(key: key);

  final Function(BuildContext) onDelete;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _DeleteMenuButton(
        onDelete: onDelete,
      ),
    );
  }
}

class _DeleteMenuButton extends StatelessWidget {
  const _DeleteMenuButton({
    Key? key,
    required this.onDelete,
  }) : super(key: key);

  final Function(BuildContext) onDelete;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteMenuCubit, DeleteMenuState>(
      listener: (context, deleteMenuState) {
        deleteMenuState.maybeWhen(
          success: () {
            Locator.instance<NavigatorHelper>().goToMenus();
            Locator.instance<ToastService>().init(
              const DSToast.notification(text: 'Your menu has been deleted'),
            );
          },
          error: (exception) {
            DialogService.showErrorDialog(
              context: context,
              failure: CustomException(message: exception.toString()),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, deleteMenuState) {
        return DeleteResourceButton(
          args: DeleteResourceButtonArgs(
            onPressed: deleteMenuState.maybeWhen(
              deleting: () => null,
              orElse: () => () => onDelete(context),
            ),
          ),
        );
      },
    );
  }
}
