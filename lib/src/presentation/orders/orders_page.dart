import 'package:flutter/material.dart';
import 'package:meny_admin/src/data/models/orders/order_model.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // LinearProgressIndicator(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Orders', style: Theme.of(context).textTheme.headline5),
              const Divider(),
              SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: DataTable(
                      onSelectAll: (val) {},
                      showBottomBorder: true,
                      columns: [
                        DataColumn(label: Text('Amount'.toUpperCase())),
                        DataColumn(label: Text('Customer'.toUpperCase())),
                        DataColumn(label: Text('Date'.toUpperCase())),
                        const DataColumn(label: Text('')),
                      ],
                      rows: [
                        OrderModel(
                          displayName: 'Jack Grossmann',
                          orderNumber: '1',
                          amount: 200,
                          createdAt: DateTime.now(),
                        ),
                        OrderModel(
                          displayName: 'Quenten Sponsolee',
                          orderNumber: '2',
                          amount: 2085,
                          createdAt: DateTime.now(),
                        ),
                      ]
                          .map(
                            (model) => DataRow(
                              onSelectChanged: (val) {},
                              cells: [
                                DataCell(Text((model.amount / 100).toString())),
                                DataCell(Text(model.displayName)),
                                DataCell(Text(model.createdAt.toString())),
                                DataCell(
                                  IconButton(
                                    icon: const Icon(Icons.more_horiz),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('2 results'),
                  ButtonBar(
                    buttonTextTheme: ButtonTextTheme.normal,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Previous'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
