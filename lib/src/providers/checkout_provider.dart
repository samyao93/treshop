import 'package:flutter/foundation.dart';

class CheckoutProvider with ChangeNotifier {
  int? _addressSelected;
  int? get addressSelected => _addressSelected;
  set addressSelected(int? val){
    _addressSelected = val;
    notifyListeners();
  }
}
