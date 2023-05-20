import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class MyStoreHoursTab extends StatelessWidget {
  const MyStoreHoursTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _MyStoreHoursTab();
  }
}

class _MyStoreHoursTab extends HookWidget {
  const _MyStoreHoursTab({Key? key}) : super(key: key);

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
                    const PageTitle(title: 'Store Hours'),
                    const Spacer(),
                    DSButton(
                      onPressed: () {},
                      text: 'Save',
                    ),
                  ],
                ),
                DSVerticalSpacing.medium(),
              ],
            ),
          );
        },
        orElse: SizedBox.shrink,
      ),
    );
  }
}
