import 'package:data_table_2/data_table_2.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenusTable extends StatelessWidget {
  const MenusTable({
    Key? key,
    required this.menus,
  }) : super(key: key);
  final List<MenuModel> menus;

  @override
  Widget build(BuildContext context) {
    return ResourceTable<MenuModel>(
      header: const PageTitle(title: 'Menus'),
      action: const NewMenuButton(),
      resources: menus,
      columns: const [
        DataColumn2(
          label: Text('Name'),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Text(''),
          fixedWidth: 100,
          size: ColumnSize.S,
        ),
      ],
      cellsBuilder: (_, menu) {
        return <DataCell>[
          DataCell(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(menu.name),
                DSText.caption(
                  'Last updated: ${menu.updatedAt?.formatWith(
                        'MM/dd/yy @ h:mm a',
                      ) ?? ''}',
                ),
              ],
            ),
          ),
          DataCell(
            TextButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
              ),
              child: const Text('Preview'),
              onPressed: () => ActionService.run(
                () => GoRouter.of(context).goNamed(
                  MenuPreviewScreen.routeName,
                  params: {
                    'id': menu.id!,
                  },
                ),
                () => AnalyticsService.track(
                  message: Analytics.menusTabPreviewTapped,
                  params: {
                    'menuId': menu.id!,
                    'menuName': menu.name,
                  },
                ),
              ),
            ),
          ),
        ];
      },
      emptyMessage: 'No menus yet. Click "New" above to get started!',
      onTapItem: (_, menu) {
        ActionService.run(
          () {
            GoRouter.of(context).goNamed(
              EditMenuScreen.routeName,
              params: {
                'id': menu.id!,
              },
            );
          },
          () => AnalyticsService.track(
            message: Analytics.menusTabItemSelected,
          ),
        );
      },
    );
  }
}
