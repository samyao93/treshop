import 'cart_model.dart';

class CheckoutModel {
  final List<CartModel>? products;
  final int? couponId;
  final int? total;

  CheckoutModel({this.products, this.couponId, this.total});
}
