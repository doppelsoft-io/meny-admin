import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({
    Key? key,
    required this.exception,
  }) : super(key: key);

  final CustomException exception;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.topCenter,
      child: Text(
        exception.toString(),
        style: TextStyle(
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
