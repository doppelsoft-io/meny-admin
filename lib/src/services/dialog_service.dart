import 'package:flutter/material.dart';
import 'package:meny/src/data/core/failures.dart';

class DialogService {
  const DialogService._();

  static void showErrorDialog({
    required BuildContext context,
    required Failure failure,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          title: Container(
            color: Theme.of(context).errorColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Text(
                'Error',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
            ),
          ),
          content: Text(failure.message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).errorColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
