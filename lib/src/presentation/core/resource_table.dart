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
  }) : super(key: key);

  final Widget header;
  final Widget action;
  final List<T> resources;
  final List<DataColumn2> columns;
  final List<DataCell> Function(BuildContext, T) cellsBuilder;
  final Function(BuildContext, T) onTapItem;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DSSpacing.medium,
            vertical: DSSpacing.small,
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
            empty: Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(DSSpacing.medium),
                child: Text(emptyMessage),
              ),
            ),
            dataRowHeight: 68,
            horizontalMargin: DSSpacing.medium,
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
