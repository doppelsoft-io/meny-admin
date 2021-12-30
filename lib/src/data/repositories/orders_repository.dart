import 'package:dartz/dartz.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/models/orders/order_model.dart';

class OrdersRepository {
  Future<Either<Failure, List>> get() {
    return Future.delayed(const Duration(milliseconds: 300), () {
      return right([
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
      ]);
    });
  }
}
