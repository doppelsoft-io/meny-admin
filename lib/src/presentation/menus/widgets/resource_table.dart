import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/presentation/resources/cubit/resources_cubit.dart';

class ResourceTable<T> extends StatelessWidget {
  const ResourceTable({
    Key? key,
    required this.columnNames,
    required this.dataColumnBuilder,
    required this.dataRowBuilder,
    required this.emptyRowBuilder,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  final List<String> columnNames;

  final DataColumn Function(
    BuildContext context,
    String column,
  ) dataColumnBuilder;

  final DataRow Function(
    BuildContext context,
    T model,
  ) dataRowBuilder;

  final DataRow Function(
    BuildContext context,
  ) emptyRowBuilder;

  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResourcesCubit, ResourcesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ResourcesFailure:
            final _state = state as ResourcesFailure;
            return Center(
              child: Text(_state.failure.message),
            );
          case ResourcesLoaded:
            final _state = state as ResourcesLoaded;
            return DataTable(
              dataRowHeight: 100,
              showCheckboxColumn: false,
              showBottomBorder: true,
              columns: _state.resources.isEmpty
                  ? List.generate(
                      1,
                      (index) => dataColumnBuilder(context, columnNames[index]),
                    )
                  : List.generate(
                      columnNames.length,
                      (index) {
                        return dataColumnBuilder(
                          context,
                          columnNames[index],
                        );
                      },
                    ).toList(),
              rows: _state.resources.isEmpty
                  ? List.generate(1, (index) => emptyRowBuilder(context))
                  : List.generate(
                      _state.resources.length,
                      (index) {
                        return dataRowBuilder(
                          context,
                          _state.resources[index] as T,
                        );
                      },
                    ),
            );
          case ResourcesLoading:
          default:
            return Column(children: const [LinearProgressIndicator()]);
        }
      },
    );
  }
}
