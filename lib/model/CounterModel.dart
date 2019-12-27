import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int count = 0;

  void add() {
    count++;
    notifyListeners();
  }
}