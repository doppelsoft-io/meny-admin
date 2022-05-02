import 'package:flutter/material.dart';
import 'package:meny/src/data/core/failures.dart';

class ErrorDisplay extends StatelessWidget {
  final Failure failure;

  const ErrorDisplay({
    Key? key,
    required this.failure,
  }) : super(key: key);

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
