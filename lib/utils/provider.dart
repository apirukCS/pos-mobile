import 'package:flutter/material.dart';

class CountProductInCart with ChangeNotifier{
  int _count = 0;

  int get count => _count;

  void upDateCount(int count) {
    _count = count;
    notifyListeners();
  }
}