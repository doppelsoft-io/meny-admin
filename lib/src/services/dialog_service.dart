import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';

class DialogService {
  const DialogService._();

  static void showErrorDialog({
    required BuildContext context,
    required CustomException failure,
  }) {
    showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          title: Container(
            color: Theme.of(context).errorColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              child: Text(
                'Error',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
            ),
          ),
          content: Text(failure.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).errorColor,
                ),
              ),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
