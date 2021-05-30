import 'package:flutter/foundation.dart';

class SearchProvider with ChangeNotifier {
  int? _sortSelected;
  int? get sortSelected => _sortSelected;
  set sortSelected(int? val) {
    _sortSelected = val;
    notifyListeners();
  }

  int? _sizeSelected;
  int? get sizeSelected => _sizeSelected;
  set sizeSelected(int? val) {
    _sizeSelected = val;
    notifyListeners();
  }

  int? _colorSelected;
  int? get colorSelected => _colorSelected;
  set colorSelected(int? val) {
    _colorSelected = val;
    notifyListeners();
  }

  int? _categorySelected;
  int? get categorySelected => _categorySelected;
  set categorySelected(int? val) {
    _categorySelected = val;
    notifyListeners();
  }
  String? _brandSelected;
  String? get brandSelected => _brandSelected;
  set brandSelected(String? val) {
    _brandSelected = val;
    notifyListeners();
  }
}
