import 'package:flutter/material.dart';

class UiState extends ChangeNotifier {
  bool _isAdmin = true;
  // Brightness.light; // SchedulerBinding.instance.window.platformBrightness;
  //GETTERS
  bool get isAdmin => _isAdmin;

//SETTERS
  void setIsAdmin({required bool isAdmin}) {
    _isAdmin = isAdmin;
    notifyListeners();
  }
}
