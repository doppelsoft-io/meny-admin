import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/themes.dart';

class MenuItemNameField extends StatelessWidget {
  const MenuItemNameField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return _MenuItemNameField(controller: controller);
  }
}

class _MenuItemNameField extends StatelessWidget {
  const _MenuItemNameField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DTextFormField(
      theme: Themes.theme.textFormFieldThemeData,
      args: DTextFormFieldArgs(
        controller: controller,
        autofocus: true,
        autocorrect: false,
        decoration: const InputDecoration(
          hintText: 'Enter a name',
        ),
        textInputAction: TextInputAction.next,
        validator: (value) => FormValidatorHelper.validateExists(
          value,
          message: 'Please add a name for your item',
        ),
      ),
    );
  }
}
