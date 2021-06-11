import 'package:treshop/src/models/cart_model.dart';

enum OrderStatus {pending, packaging, onDelivery, success }

class OrderModel {
  final List<CartModel>? products;
  final int? total;
  final OrderStatus? status;
  final DateTime? dateOrder;

  OrderModel({this.products, this.total, this.status, this.dateOrder});
}
