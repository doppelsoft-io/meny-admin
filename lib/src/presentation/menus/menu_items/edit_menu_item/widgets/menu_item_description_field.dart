import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/themes.dart';

class MenuItemDescriptionField extends StatelessWidget {
  const MenuItemDescriptionField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return _MenuItemDescriptionField(controller: controller);
  }
}

class _MenuItemDescriptionField extends StatelessWidget {
  const _MenuItemDescriptionField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DSTextFormField(
      theme: Themes.theme.textFormFieldThemeData.copyWith(
        maxLines: 3,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      args: DSTextFormFieldArgs(
        controller: controller,
        autocorrect: false,
        decoration: const InputDecoration(
          hintText: 'Enter a description',
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
