import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';

class MyStoreLocationsTab extends StatelessWidget {
  const MyStoreLocationsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _MyStoreLocationsTab();
  }
}

class _MyStoreLocationsTab extends HookWidget {
  const _MyStoreLocationsTab({Key? key}) : super(key: key);

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
                    DText.headline5('Store Locations'),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Save'),
                    ),
                  ],
                ),
                VerticalSpacing.medium(),
              ],
            ),
          );
        },
        orElse: SizedBox.shrink,
      ),
    );
  }
}
