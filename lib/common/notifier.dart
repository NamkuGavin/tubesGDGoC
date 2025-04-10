import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  bool _isPasswordNotVisible = true;

  bool get isPasswordNotVisible => _isPasswordNotVisible;

  void togglePassVisible() {
    _isPasswordNotVisible = !_isPasswordNotVisible;
    notifyListeners();
  }
}
