import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/modifier_groups/modifier_groups.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/modifier_groups/widgets/new_modifier_group_button.dart';
import 'package:meny_admin/src/screens/screens.dart';
import 'package:meny_admin/src/services/services.dart';

class MenusScreenModifierGroupsTab extends StatelessWidget {
  const MenusScreenModifierGroupsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ModifierGroupsCubit>(
          create: (context) => ModifierGroupsCubit(),
        ),
        BlocProvider<CreateModifierGroupCubit>(
          create: (context) => CreateModifierGroupCubit(
            storeCubit: context.read<StoreCubit>(),
          ),
        ),
      ],
      child: BlocListener<StoreCubit, StoreState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (store) {
              context.read<ModifierGroupsCubit>().load(storeId: store.id!);
            },
            orElse: () {},
          );
        },
        child: const _MenusScreenModifierGroupsTab(),
      ),
    );
  }
}

class _MenusScreenModifierGroupsTab extends HookWidget {
  const _MenusScreenModifierGroupsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modifierGroupsState = context.watch<ModifierGroupsCubit>().state;

    useEffect(
      () {
        final storeState = context.read<StoreCubit>().state;
        final storeId = storeState.whenOrNull(loaded: (_) => _.id);
        if (storeId != null) {
          context.read<ModifierGroupsCubit>().load(storeId: storeId);
        }
        return null;
      },
      const [],
    );
    return BlocListener<CreateModifierGroupCubit, CreateModifierGroupState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          creating: (_) {
            showDialog<void>(
              context: context,
              useRootNavigator: false,
              barrierDismissible: false,
              barrierColor: Colors.black12,
              builder: (_) => WillPopScope(
                onWillPop: () async => false,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
          created: (menu) {
            Navigator.of(context).pop();
            GoRouter.of(context).pushNamed(
              EditModifierGroupScreen.routeName,
              params: {
                'id': menu.id!,
              },
            );
          },
        );
      },
      child: SingleChildScrollView(
        child: modifierGroupsState.maybeWhen(
          loading: (_) => Column(
            children: const [
              LinearProgressIndicator(),
            ],
          ),
          loaded: (modifierGroups) {
            return DSTable(
              args: DSTableArgs(
                header: DSText.headline5('Modifier Groups'),
                actions: [
                  const NewModifierGroupButton(),
                ],
                columns: [
                  const DSTableHeader(name: 'Name'),
                  const DSTableHeader(name: 'Last Updated'),
                ],
                source: DSTableDataSource(
                  emptyBuilder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(height: kMinInteractiveDimension),
                        DSText.bodyText1(
                          'No modifier groups yet. Click "New" above to add a modifier group',
                        ),
                        const Divider(height: kMinInteractiveDimension),
                      ],
                    );
                  },
                  rows: modifierGroups
                      .map(
                        (e) => DSTableRow(
                          onSelectChanged: (selected) {
                            ActionService.run(
                              () {
                                GoRouter.of(context).goNamed(
                                  EditModifierGroupScreen.routeName,
                                  params: {'id': e.id!},
                                );
                              },
                              () => AnalyticsService.track(
                                message: Analytics
                                    .modifierGroupsTabModifierGroupSelected,
                                params: {
                                  'groupId': e.id!,
                                  'groupName': e.name,
                                },
                              ),
                            );
                          },
                          cells: [
                            DSTableCell(
                              builder: () {
                                return DSText.bodyText1(e.name);
                              },
                            ),
                            // DSTableCell(
                            //   builder: () {
                            //     return DSText.bodyText1(
                            //       (e.priceInfo.price / 100).toCurrency(),
                            //     );
                            //   },
                            // ),
                            DSTableCell(
                              builder: () {
                                return DSText.bodyText1(
                                  e.updatedAt
                                          ?.formatWith('MM/dd/yy @ h:mm a') ??
                                      '',
                                );
                              },
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          },
          orElse: SizedBox.shrink,
        ),
      ),
    );
  }
}
