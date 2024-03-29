import 'dart:math';

import 'package:flutter/material.dart';

class DigitalCalculator extends ChangeNotifier {
  num _solution = 0;
  String _input = "";
  bool _lightON = false;
  get solution => _solution;
  get input => _input;
  get lightON => _lightON;

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

  void calculateValue() {
    num calculateExpression(String expression) {
      expression.replaceAll(" ", "");
      expression = "${expression}E";
      num currentValue = 0;
      num primaryValue = 0;
      num solutionValue = 0;
      num beforeDecimal = 0;
      String operation = "";
      bool isDecimal = false;
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
          default:
            if (isDecimal == true) {
              print(beforeDecimal);
              print("--");
              print(primaryValue);
              currentValue = beforeDecimal +
                  (currentValue / (pow(10, countDigits(currentValue))));
              isDecimal = false;
            }
            if (expression[i] == ".") {
              beforeDecimal = currentValue;
              isDecimal = true;
            } else if (operation == "+") {
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

    String formattedSolution = calculateExpression(_input).toStringAsFixed(4);
    _solution = num.parse(formattedSolution);
    notifyListeners();
  }

  num countDigits(num number) {
    num count = 0;
    while (number != 0) {
      number ~/= 10;
      count++;
    }
    return count;
  }
}
