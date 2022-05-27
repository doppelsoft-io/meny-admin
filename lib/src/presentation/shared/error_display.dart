import 'package:flutter/material.dart';
import 'package:meny_admin/src/data/core/failures.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({
    Key? key,
    required this.failure,
  }) : super(key: key);

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.topCenter,
      child: Text(
        failure.message,
        style: TextStyle(
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
