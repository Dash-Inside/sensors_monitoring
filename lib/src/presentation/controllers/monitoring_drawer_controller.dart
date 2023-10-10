import 'package:flutter/material.dart';

class MonitoringDrawerController with ChangeNotifier {
  bool _isOpen = true;
  bool get isOpen => _isOpen;

  set isOpen(bool value) {
    _isOpen = value;
    notifyListeners();
  }

  void onDrawerButtonPressed() {
    isOpen = !isOpen;
  }
}
