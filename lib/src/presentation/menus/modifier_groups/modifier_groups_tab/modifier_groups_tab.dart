import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';

class ModifierGroupsTab extends StatelessWidget {
  const ModifierGroupsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ModifierGroupsCubit>(
          create: (context) => ModifierGroupsCubit(
            authCubit: context.read<AuthCubit>(),
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
    return modifierGroupsState.maybeWhen(
      loading: (_) => const Center(child: CircularProgressIndicator()),
      loaded: (groups) {
        return groups.isEmpty
            ? const NoResultsTable(
                headline: 'Modifier Groups',
                title: 'No modifier groups yet',
                message: 'Click "New" to create one!',
                actions: [NewModifierGroupButton()],
              )
            : SingleChildScrollView(
                child: DSTable(
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
                      rows: groups
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
                                DSTableCell(
                                  builder: () {
                                    return DSText.bodyText1(
                                      e.updatedAt?.formatWith(
                                            'MM/dd/yy @ h:mm a',
                                          ) ??
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
                ),
              );
      },
      orElse: SizedBox.shrink,
    );
  }
}
