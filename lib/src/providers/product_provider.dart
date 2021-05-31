import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  int? _itemSizeSelected;
  int? get itemSizeSelected => _itemSizeSelected;
  set itemSizeSelected(int? val) {
    _itemSizeSelected = val;
    notifyListeners();
  }

  int? _itemColorSelected;
  int? get itemColorSelected => _itemColorSelected;
  set itemColorSelected(int? val) {
    _itemColorSelected = val;
    notifyListeners();
  }
}
