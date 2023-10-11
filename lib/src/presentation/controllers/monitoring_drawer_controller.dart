import 'package:flutter/material.dart';

class MonitoringDrawerController with ChangeNotifier {
  bool _isOpen = true;
  bool _isSearchActive = false;

  bool get isOpen => _isOpen;
  set isOpen(bool value) {
    _isOpen = value;
    notifyListeners();
  }

  bool get isSearchActive => _isSearchActive;
  set isSearchActive(bool value) {
    if (value) {
      _isOpen = true;
      _isSearchActive = true;
    } else {
      _isSearchActive = false;
    }

    notifyListeners();
  }

  void openSearchModule() => isSearchActive = true;
  void closeSearchModule() => isSearchActive = false;
  void onDrawerButtonPressed() => isOpen = !isOpen;
}
