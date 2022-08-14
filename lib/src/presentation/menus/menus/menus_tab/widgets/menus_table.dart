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
    return DSTable(
      args: DSTableArgs(
        header: DSText.headline5('Menus'),
        actions: [
          const NewMenuButton(),
        ],
        columns: [
          const DSTableHeader(name: 'Name'),
          // const DSTableHeader(name: 'Last Updated'),
          const DSTableHeader(name: ''),
        ],
        source: DSTableDataSource(
          emptyBuilder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(height: kMinInteractiveDimension),
                DSText.bodyText1(
                  'No menus yet. Click "New" above to add a menu',
                ),
                const Divider(height: kMinInteractiveDimension),
              ],
            );
          },
          rows: menus
              .map(
                (e) => DSTableRow(
                  onSelectChanged: (selected) {
                    ActionService.run(
                      () {
                        GoRouter.of(context).goNamed(
                          EditMenuScreen.routeName,
                          params: {
                            'id': e.id!,
                          },
                        );
                      },
                      () => AnalyticsService.track(
                        message: Analytics.menusTabItemSelected,
                      ),
                    );
                  },
                  cells: [
                    DSTableCell(
                      builder: () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DSText.bodyText2(
                            e.name,
                            styleOverrides: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          DSText.caption(
                            'Last updated: ${e.updatedAt?.formatWith(
                                  'MM/dd/yy @ h:mm a',
                                ) ?? ''}',
                          ),
                        ],
                      ),
                    ),
                    DSTableCell(
                      builder: () {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
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
                                  'id': e.id!,
                                },
                              ),
                              () => AnalyticsService.track(
                                message: Analytics.menusTabPreviewTapped,
                                params: {
                                  'menuId': e.id!,
                                  'menuName': e.name,
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // DSTableCell(
                    //   builder: () {
                    //     return SizedBox(
                    //       width: 200,
                    //       child: DSText.bodyText1(
                    //         e.updatedAt?.formatWith(
                    //               'MM/dd/yy @ h:mm a',
                    //             ) ??
                    //             '',
                    //       ),
                    //     );
                    //   },
                    // ),
                    // DSTableCell(
                    //   builder: () {
                    //     return Row(
                    //       children: [
                    //         TextButton(
                    //           style: ButtonStyle(
                    //             alignment: Alignment.center,
                    //             padding: MaterialStateProperty.all(
                    //               EdgeInsets.zero,
                    //             ),
                    //           ),
                    //           child: const Text('Preview'),
                    //           onPressed: () => ActionService.run(
                    //             () => GoRouter.of(context).goNamed(
                    //               MenuPreviewScreen.routeName,
                    //               params: {
                    //                 'id': e.id!,
                    //               },
                    //             ),
                    //             () => AnalyticsService.track(
                    //               message: Analytics.menusTabPreviewTapped,
                    //               params: {
                    //                 'menuId': e.id!,
                    //                 'menuName': e.name,
                    //               },
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
