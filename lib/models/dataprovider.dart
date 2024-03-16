import 'package:flutter/material.dart';

class DigitalCalculator extends ChangeNotifier {
  num _solution = 0;
  String _input = " ";
  get solution => _solution;
  get input => _input;

  void typeInput(String letter) {
    _input = _input + letter;
    notifyListeners();
  }

  void ac() {
    _input = " ";
    notifyListeners();
  }

  void delete() {
    _input.trimRight();
    notifyListeners();
  }
}
