import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/src/utils/utils.dart';
import 'package:meny_admin/themes.dart';

class MenuItemPriceField extends StatelessWidget {
  const MenuItemPriceField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return _MenuItemPriceField(controller: controller);
  }
}

class _MenuItemPriceField extends StatelessWidget {
  const _MenuItemPriceField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 225,
      child: DTextFormField(
        theme: Themes.theme.textFormFieldThemeData,
        args: DTextFormFieldArgs(
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
            prefixIcon: Icon(
              Icons.attach_money,
            ),
            hintText: 'Enter a price',
          ),
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}
