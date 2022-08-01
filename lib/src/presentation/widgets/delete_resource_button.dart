import 'package:flutter/material.dart';

class DeleteResourceButtonArgs {
  DeleteResourceButtonArgs({
    required this.onPressed,
    this.buttonStyle,
    this.text = 'Delete',
    this.textStyle,
  });

  final Function()? onPressed;
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
    final buttonStyle = args.buttonStyle ??
        OutlinedButton.styleFrom(
          primary: Colors.grey[100],
        );

    final textStyle =
        args.textStyle ?? TextStyle(color: Theme.of(context).errorColor);

    return OutlinedButton(
      onPressed: args.onPressed,
      style: buttonStyle,
      child: Text(args.text, style: textStyle),
    );
  }
}
