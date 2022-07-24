import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';

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
                    DSText.headline5('Store Hours'),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Save'),
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
