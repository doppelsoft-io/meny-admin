class OrderModel {
  final String displayName;
  final String orderNumber;
  final double amount;
  final DateTime createdAt;

  OrderModel({
    required this.displayName,
    required this.orderNumber,
    required this.amount,
    required this.createdAt,
  });
}
