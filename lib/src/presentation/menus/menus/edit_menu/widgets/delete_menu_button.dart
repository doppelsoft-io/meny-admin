import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny_admin/locator.dart';
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
            Navigator.of(context).pop();
            Locator.instance<ToastService>().showNotification(
              const Text('Your menu has been deleted'),
              ToastType.error,
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
