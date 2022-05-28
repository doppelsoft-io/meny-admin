import 'package:dartz/dartz.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';

class OrdersRepository {
  Future<Either<CustomException, List>> get() {
    throw UnimplementedError();
    // return Future<void>.delayed(const Duration(milliseconds: 300), () {
    //   return right([
    //     OrderModel(
    //       displayName: 'Jack Grossmann',
    //       orderNumber: '1',
    //       amount: 200,
    //       createdAt: DateTime.now(),
    //     ),
    //     OrderModel(
    //       displayName: 'Quenten Sponsolee',
    //       orderNumber: '2',
    //       amount: 2085,
    //       createdAt: DateTime.now(),
    //     ),
    //   ]);
    // });
  }
}
