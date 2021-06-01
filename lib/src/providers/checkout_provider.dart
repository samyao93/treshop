import 'package:flutter/foundation.dart';
import 'package:treshop/src/models/checkout_model.dart';

class CheckoutProvider with ChangeNotifier {
  int? _addressSelected;
  int? get addressSelected => _addressSelected;
  set addressSelected(int? val) {
    _addressSelected = val;
    notifyListeners();
  }

  int? _paymentSelected;
  int? get paymentSelected => _paymentSelected;
  set paymentSelected(int? val) {
    _paymentSelected = val;
    notifyListeners();
  }

  int? _shippingSelected;
  int? get shippingSelected => _shippingSelected;
  set shippingSelected(int? val) {
    _shippingSelected = val;
    notifyListeners();
  }

  List<CheckoutModel> _checkoutList = [];
  List<CheckoutModel> get checkoutList => _checkoutList;
  set checkoutList(List<CheckoutModel> val) {
    _checkoutList = val;
    notifyListeners();
  }
}
