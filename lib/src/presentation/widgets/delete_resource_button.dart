import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/themes.dart';

class DeleteResourceButtonArgs {
  DeleteResourceButtonArgs({
    required this.onPressed,
    this.buttonStyle,
    this.text = 'DELETE',
    this.textStyle,
  });

  final void Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final String text;
  final TextStyle? textStyle;
}

class DeleteResourceButton extends StatelessWidget {
  const DeleteResourceButton({
    Key? key,
    required this.args,
  }) : super(key: key);

  final DeleteResourceButtonArgs args;

  @override
  Widget build(BuildContext context) {
    return DSButton(
      theme: DSButtonThemeData.fallback().copyWith(
        primary: Themes.colorScheme.error,
      ),
      onPressed: args.onPressed,
      type: DSButtonType.outlined,
      child: Text(args.text),
    );
  }
}
