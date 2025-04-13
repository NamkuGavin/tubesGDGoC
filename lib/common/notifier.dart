import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppState with ChangeNotifier {
  bool _isPasswordNotVisible = true;
  int _currentIndex = 0;
  final _dateController = TextEditingController();
  String _selectedCategoryIncome = "Gaji";
  String _selectedCategorySpending = "Belanja";

  bool get isPasswordNotVisible => _isPasswordNotVisible;
  int get currentIndex => _currentIndex;
  TextEditingController get dateController => _dateController;
  String get selectedCategoryIncome => _selectedCategoryIncome;
  String get selectedCategorySpending => _selectedCategorySpending;

  void togglePassVisible() {
    _isPasswordNotVisible = !_isPasswordNotVisible;
    notifyListeners();
  }

  void onBarTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void formatDateControll(DateTime? picked) {
    _dateController.text = DateFormat('d MMM yyyy').format(picked!);
    notifyListeners();
  }

  void changeCategoryIncome(String? value) {
    _selectedCategoryIncome = value!;
    notifyListeners();
  }

  void changeCategorySpending(String? value) {
    _selectedCategorySpending = value!;
    notifyListeners();
  }
}
