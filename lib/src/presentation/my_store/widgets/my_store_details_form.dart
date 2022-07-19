import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/data/stores/cubits/cubits.dart';
import 'package:meny_admin/themes.dart';
import 'package:meny_core/meny_core.dart';

class MyStoreDetailsForm extends StatelessWidget {
  const MyStoreDetailsForm({
    Key? key,
    required this.store,
    required this.onNameChanged,
  }) : super(key: key);

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final StoreModel store;
  final ValueChanged<String> onNameChanged;

  @override
  Widget build(BuildContext context) {
    return _MyStoreDetailsForm(
      store: store,
      onNameChanged: onNameChanged,
    );
  }
}

class _MyStoreDetailsForm extends HookWidget {
  const _MyStoreDetailsForm({
    Key? key,
    required this.store,
    required this.onNameChanged,
  }) : super(key: key);

  final StoreModel store;
  final ValueChanged<String> onNameChanged;

  @override
  Widget build(BuildContext context) {
    final storeNameController = useTextEditingController();

    useEffect(
      () {
        context.read<EditStoreCubit>().update(store);
        TextEditingControllerHelper.setText(storeNameController, store.name);
        return null;
      },
      [store],
    );

    return Form(
      key: MyStoreDetailsForm.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DText.subtitle1('Name'),
          VerticalSpacing.smallest(),
          DTextFormField(
            theme: Themes.theme.textFormFieldThemeData,
            args: DTextFormFieldArgs(
              controller: storeNameController,
              onChanged: onNameChanged,
              validator: (value) => FormValidatorHelper.validateExists(
                value,
                message: 'Please enter a name for your store',
              ),
              decoration: const InputDecoration(
                hintText: 'Add a name for your store',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
