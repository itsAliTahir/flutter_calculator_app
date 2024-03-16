import 'package:flutter/material.dart';

class DigitalCalculator extends ChangeNotifier {
  num _solution = 0;
  String _input = "";
  get solution => _solution;
  get input => _input;

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

  void calculateValue() {
    num calculateExpression(String expression) {
      expression.replaceAll(" ", "");
      expression = "${expression}E";
      double currentValue = 0;
      double primaryValue = 0;
      double solutionValue = 0;
      String operation = "";
      for (int i = 0; i < expression.length; i++) {
        switch (expression[i]) {
          case "0":
            currentValue = currentValue * 10;
            break;
          case "1":
            currentValue = currentValue * 10 + 1;
            break;
          case "2":
            currentValue = currentValue * 10 + 2;
            break;
          case "3":
            currentValue = currentValue * 10 + 3;
            break;
          case "4":
            currentValue = currentValue * 10 + 4;
            break;
          case "5":
            currentValue = currentValue * 10 + 5;
            break;
          case "6":
            currentValue = currentValue * 10 + 6;
            break;
          case "7":
            currentValue = currentValue * 10 + 7;
            break;
          case "8":
            currentValue = currentValue * 10 + 8;
            break;
          case "9":
            currentValue = currentValue * 10 + 9;
            break;
          case ".":
            currentValue = currentValue * 10 + 9;
            break;
          default:
            if (operation == "%") {}
            if (operation == "+") {
              solutionValue = primaryValue + currentValue;
              currentValue = solutionValue;
            } else if (operation == "-") {
              solutionValue = primaryValue - currentValue;
              currentValue = solutionValue;
            } else if (operation == "×") {
              solutionValue = primaryValue * currentValue;
              currentValue = solutionValue;
            } else if (operation == "÷") {
              solutionValue = primaryValue / currentValue;
              currentValue = solutionValue;
            } else {
              solutionValue = currentValue;
            }
            primaryValue = currentValue;
            currentValue = 0;
            operation = expression[i];
            break;
        }
      }
      return solutionValue;
    }

    _solution = calculateExpression(_input);
    notifyListeners();
  }
}
