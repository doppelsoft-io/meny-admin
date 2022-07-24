import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/src/utils/utils.dart';
import 'package:meny_admin/themes.dart';

class MenuItemTaxInfoField extends StatelessWidget {
  const MenuItemTaxInfoField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return _MenuItemTaxInfoField(controller: controller);
  }
}

class _MenuItemTaxInfoField extends StatelessWidget {
  const _MenuItemTaxInfoField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 225,
      child: DSTextFormField(
        theme: Themes.theme.textFormFieldThemeData,
        args: DSTextFormFieldArgs(
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          inputFormatters: [
            ValidatorInputFormatter(
              editingValidator: DecimalNumberEditingRegexValidator(),
            ),
          ],
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter tax rate',
            prefixIcon: Icon(
              Icons.percent,
            ),
          ),
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}
