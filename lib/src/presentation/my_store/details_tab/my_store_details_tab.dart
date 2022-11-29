import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';

class MyStoreDetailsTab extends StatelessWidget {
  const MyStoreDetailsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditStoreCubit(
        storeCubit: context.read<StoreCubit>(),
      ),
      child: BlocListener<EditStoreCubit, EditStoreState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (_) {
              Locator.instance<ToastService>().init(
                const DSToast.notification(text: 'Store updated'),
              );
            },
            error: (_, exception) {
              DialogService.showErrorDialog(
                context: context,
                failure: CustomException(message: exception.toString()),
              );
            },
            orElse: () {},
          );
        },
        child: const _MyStoreDetailsTab(),
      ),
    );
  }
}

class _MyStoreDetailsTab extends HookWidget {
  const _MyStoreDetailsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeState = context.watch<StoreCubit>().state;

    return SingleChildScrollView(
      child: storeState.maybeWhen(
        loading: (_) => ScaffoldBuilder.loading(),
        loaded: (store) {
          return Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const PageTitle(title: 'Store Details'),
                    const Spacer(),
                    DSButton(
                      onPressed: () {
                        final isValid =
                            MyStoreDetailsForm.formKey.currentState!.validate();
                        if (!isValid) return;
                        context.read<EditStoreCubit>().save();
                      },
                      text: 'Save',
                    ),
                  ],
                ),
                DSVerticalSpacing.medium(),
                MyStoreDetailsForm(
                  store: store,
                  onNameChanged: (name) {
                    context.read<EditStoreCubit>().update(
                          store.copyWith(name: name),
                        );
                  },
                ),
              ],
            ),
          );
        },
        orElse: SizedBox.shrink,
      ),
    );
  }
}
