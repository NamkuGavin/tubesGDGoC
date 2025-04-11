import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  bool _isPasswordNotVisible = true;
  int _currentIndex = 0;

  bool get isPasswordNotVisible => _isPasswordNotVisible;
  int get currentIndex => _currentIndex;

  void togglePassVisible() {
    _isPasswordNotVisible = !_isPasswordNotVisible;
    notifyListeners();
  }

  void onBarTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
