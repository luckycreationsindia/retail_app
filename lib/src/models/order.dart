import 'package:isar/isar.dart';

part 'order.g.dart';

@collection
@Name("orders")
class Order {
  int get isarId => Isar.fastHash(id);
  String id;
  String name;
  // String orderPre;
  int orderNo;
  // String orderPost;
  List<OrderItems> items;
  int qty;
  double gross;
  double discount;
  double tax;
  double net;
  double netRound;
  int paymentType;
  int paymentStatus;
  bool status;
  DateTime? createdAt = DateTime.now();
  DateTime? updatedAt;

  Order({
    required this.id,
    required this.name,
    // required this.orderPre,
    required this.orderNo,
    // required this.orderPost,
    required this.items,
    required this.qty,
    required this.gross,
    this.discount = 0,
    this.tax = 0,
    required this.net,
    required this.netRound,
    this.paymentType = 0,
    this.paymentStatus = 0,
    this.status = true,
    this.createdAt,
    this.updatedAt,
  });
}

@embedded
@Name("order_items")
class OrderItems {
  String id;
  String product;
  int qty;
  double price;
  double gross;
  double tax;
  double discount;
  double net;
  double netRound;

  OrderItems({
    required this.id,
    required this.product,
    required this.qty,
    required this.price,
    required this.gross,
    this.tax = 0,
    this.discount = 0,
    required this.net,
    required this.netRound,
  });
}