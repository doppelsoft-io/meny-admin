import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenuItemsTable extends StatelessWidget {
  const MenuItemsTable({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<MenuItemModel> items;

  @override
  Widget build(BuildContext context) {
    return DSTable(
      theme: DSTableThemeData.fallback().copyWith(
        rowHeight: 64,
      ),
      args: DSTableArgs(
        header: DSText.headline5('Items'),
        actions: [
          const NewMenuItemButton(),
        ],
        columns: [
          const DSTableHeader(name: 'Photo'),
          const DSTableHeader(name: 'Name'),
          const DSTableHeader(name: 'Price'),
          const DSTableHeader(name: 'Last Updated'),
        ],
        source: DSTableDataSource(
          rows: items
              .map(
                (i) => DSTableRow(
                  onSelectChanged: (selected) {
                    ActionService.run(
                      () {
                        GoRouter.of(context).pushNamed(
                          EditMenuItemScreen.routeName,
                          params: {
                            'id': i.id!,
                          },
                        );
                      },
                      () => AnalyticsService.track(
                        message: Analytics.ingredientsTabIngredientSelected,
                        params: {
                          'itemId': i.id!,
                          'itemName': i.name,
                        },
                      ),
                    );
                  },
                  cells: [
                    DSTableCell(
                      builder: () {
                        return DSImageUploadCard(
                          theme: DSImageUploadCardThemeData.thumbnail(),
                          url: i.imageUrl ?? '',
                        );
                      },
                    ),
                    DSTableCell(
                      builder: () {
                        return DSText.bodyText1(i.name);
                      },
                    ),
                    DSTableCell(
                      builder: () {
                        return DSText.bodyText1(
                          (i.priceInfo.price / 100).toCurrency(),
                        );
                      },
                    ),
                    DSTableCell(
                      builder: () {
                        return DSText.bodyText1(
                          i.updatedAt?.formatWith(
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
    );
  }
}
