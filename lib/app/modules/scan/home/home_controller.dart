import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  String? _result;

  String? get result => _result;

  set result(String? newValue) {
    _result = newValue;
    notifyListeners();
  }
}
