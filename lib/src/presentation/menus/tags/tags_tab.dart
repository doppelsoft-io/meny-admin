import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/data/tags/tags.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/presentation/menus/tags/widgets/update_tag_sheet.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class TagsTab extends StatelessWidget {
  const TagsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TagsCubit>(
          create: (context) => TagsCubit(),
        ),
      ],
      child: const _TagsTab(),
    );
  }
}

class _TagsTab extends HookWidget {
  const _TagsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tagsState = context.watch<TagsCubit>().state;

    useEffect(
      () {
        final storeCubit = context.read<StoreCubit>();
        final storeId = storeCubit.state.store.id!;
        context.read<TagsCubit>().load(storeId: storeId);
        return null;
      },
      const [],
    );

    return BlocListener<StoreCubit, StoreState>(
      listenWhen: (prev, curr) => prev.store != curr.store,
      listener: (context, state) =>
          context.read<TagsCubit>().load(storeId: state.store.id!),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              pinned: true,
              delegate: MenusPagePersistentHeaderDelegate(
                title: 'Tags',
                onNewPressed: () => ActionService.run(
                  () => UpdateTagSheet.open(
                    context: context,
                    resource: TagModel.empty(),
                  ),
                  () => AnalyticsService.track(
                    message: Analytics.tagsTabNewTapped,
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(Spacing.pageSpacing),
          child: tagsState.maybeWhen(
            loading: (_) => Column(
              children: const [
                LinearProgressIndicator(),
              ],
            ),
            loaded: (tags) {
              return DataTable(
                showCheckboxColumn: false,
                showBottomBorder: true,
                columns: tags.isEmpty
                    ? [const DataColumn(label: Text('Name'))]
                    : const [
                        DataColumn(label: Text('Name')),
                        DataColumn(
                          label: Text(
                            'Created',
                          ),
                        ),
                      ],
                rows: tags.isEmpty
                    ? [
                        const DataRow(
                          cells: [
                            DataCell(
                              Text(
                                'Tags you create will appear here! Click "New" to add one.',
                              ),
                            )
                          ],
                        )
                      ]
                    : tags
                        .map(
                          (e) => DataRow(
                            onSelectChanged: (selected) {
                              ActionService.run(
                                () => UpdateTagSheet.open(
                                  context: context,
                                  resource: e,
                                ),
                                () => AnalyticsService.track(
                                  message: Analytics.tagsTabtagselected,
                                  params: {
                                    'tagId': e.id!,
                                    'tagName': e.name,
                                  },
                                ),
                              );
                            },
                            cells: [
                              DataCell(Text(e.name)),
                              DataCell(
                                Text(
                                  e.createdAt
                                          ?.formatWith('MM/dd/yy @ h:mm a') ??
                                      '',
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              );
            },
            orElse: SizedBox.shrink,
          ),
        ),
      ),
    );
  }
}
