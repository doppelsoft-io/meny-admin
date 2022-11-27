import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

part 'delete_resource_button.freezed.dart';

class DeleteResourceButton extends StatelessWidget {
  const DeleteResourceButton({
    Key? key,
    required this.args,
  }) : super(key: key);

  final DeleteResourceButtonArgs args;

  @override
  Widget build(BuildContext context) {
    return DSButton(
      text: args.text,
      theme: const DSButtonThemeData.elevated(
        backgroundColor: grey200Color,
        textTheme: DSTextThemeData.b4(color: blackColor),
      ),
      onPressed: args.onPressed,
    );
  }
}

@freezed
class DeleteResourceButtonArgs with _$DeleteResourceButtonArgs {
  const factory DeleteResourceButtonArgs({
    required void Function()? onPressed,
    @Default('Delete') String text,
  }) = _DeleteResourceButtonArgs;
}
