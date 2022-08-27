import 'package:data_table_2/data_table_2.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

class ResourceTable<T> extends StatelessWidget {
  const ResourceTable({
    Key? key,
    required this.header,
    required this.action,
    required this.resources,
    required this.columns,
    required this.cellsBuilder,
    required this.onTapItem,
    required this.emptyMessage,
    this.sortColumnIndex,
    this.sortAscending = true,
  }) : super(key: key);

  final Widget header;
  final Widget action;
  final List<T> resources;
  final List<DataColumn2> columns;
  final List<DataCell> Function(BuildContext, T) cellsBuilder;
  final Function(BuildContext, T) onTapItem;
  final String emptyMessage;
  final int? sortColumnIndex;
  final bool sortAscending;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DSSpacing.sm,
            vertical: DSSpacing.xs,
          ),
          child: Row(
            children: [
              header,
              const Spacer(),
              action,
            ],
          ),
        ),
        Expanded(
          child: DataTable2(
            sortColumnIndex: sortColumnIndex,
            sortAscending: sortAscending,
            empty: Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(DSSpacing.sm),
                child: Text(emptyMessage),
              ),
            ),
            dataRowHeight: 68,
            horizontalMargin: DSSpacing.sm,
            columns: columns,
            rows: resources
                .map(
                  (resource) => DataRow2(
                    onTap: () => onTapItem(context, resource),
                    cells: cellsBuilder(context, resource),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
