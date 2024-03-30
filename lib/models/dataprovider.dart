import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class DigitalCalculator extends ChangeNotifier {
  num _solution = 0;
  String _input = "";
  bool _lightON = false;
  bool _isError = false;
  get solution => _solution;
  get input => _input;
  get lightON => _lightON;
  get isError => _isError;

  void toggleLight(bool turnON) {
    _lightON = turnON;
    notifyListeners();
  }

  void typeInput(String letter) {
    _input = _input + letter;
    notifyListeners();
  }

  void ac() {
    _input = "";
    _solution = 0;
    notifyListeners();
  }

  void delete() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
    }
    notifyListeners();
  }

  void calculate(String express) {
    String inputUser = "";
    for (int i = 0; i < express.length; i++) {
      if (express[i] == '×') {
        inputUser += '*';
      } else if (express[i] == '÷') {
        inputUser += '/';
      } else {
        inputUser += express[i];
      }
    }
    _isError = false;
    double eval = 0;
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(inputUser);
      ContextModel contextModel = ContextModel();
      eval = expression.evaluate(EvaluationType.REAL, contextModel);
    } catch (error) {
      _isError = true;
      _solution = 0;
    }
    if (!_isError) {
      _solution = eval;
    }
    notifyListeners();
  }
}
