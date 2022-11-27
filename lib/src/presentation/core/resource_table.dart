import 'package:data_table_2/data_table_2.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

class ResourceTable<T> extends StatelessWidget {
  const ResourceTable({
    Key? key,
    required this.header,
    required this.action,
    this.toolbar,
    required this.resources,
    required this.columns,
    required this.cellsBuilder,
    required this.onTapItem,
    required this.emptyMessage,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.onSelectAll,
    this.onSelectChanged,
    this.isSelected,
  }) : super(key: key);

  final Widget header;
  final Widget action;
  final Widget? toolbar;
  final List<T> resources;
  final List<DataColumn2> columns;
  final List<DataCell> Function(BuildContext, T) cellsBuilder;
  final Function(BuildContext, T) onTapItem;
  final String emptyMessage;
  final int? sortColumnIndex;
  final bool sortAscending;
  final Function(bool?)? onSelectAll;
  final Function(bool?, T)? onSelectChanged;
  final bool Function(T)? isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: toolbar != null ? DSSpacing.xs : DSSpacing.sm,
            right: DSSpacing.sm,
            top: DSSpacing.xs,
            bottom: DSSpacing.xs,
          ),
          child: Row(
            children: [
              if (toolbar != null) toolbar! else header,
              const Spacer(),
              action,
            ],
          ),
        ),
        Expanded(
          child: DataTable2(
            onSelectAll: onSelectAll,
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
                    selected:
                        // ignore: avoid_bool_literals_in_conditional_expressions
                        isSelected != null ? isSelected!(resource) : false,
                    onSelectChanged: onSelectChanged != null
                        ? (selected) => onSelectChanged!(selected, resource)
                        : null,
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
