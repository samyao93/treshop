import 'package:flutter/foundation.dart';
import 'package:treshop/src/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;
  set cartList(List<CartModel> val) {
    _cartList = val;
    notifyListeners();
  }

  int? _selectedCoupon;
  int? get selectedCoupon => _selectedCoupon;
  set selectedCoupon(int? val) {
    _selectedCoupon = val;
    notifyListeners();
  }
}
