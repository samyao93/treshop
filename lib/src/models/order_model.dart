import 'package:treshop/src/models/cart_model.dart';

enum StatusOrder { packaging, on_delivery, success }

class OrderModel {
  final List<CartModel>? products;
  final int? total;
  final StatusOrder? statusOrder;
  final DateTime? dateOrder;

  OrderModel({this.products, this.total, this.statusOrder, this.dateOrder});
}
