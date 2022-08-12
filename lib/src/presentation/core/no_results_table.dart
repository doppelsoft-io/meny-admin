import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

class NoResultsTable extends StatelessWidget {
  const NoResultsTable({
    Key? key,
    required this.headline,
    required this.title,
    required this.message,
    required this.actions,
  }) : super(key: key);
  final String headline;
  final String title;
  final String message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return DSTable(
      args: DSTableArgs(
        header: DSText.headline5(headline),
        actions: actions,
        columns: [
          DSTableHeader(name: title),
        ],
        source: DSTableDataSource(
          rows: [
            DSTableRow(
              cells: [
                DSTableCell(
                  builder: () => DSText.bodyText1(message),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
