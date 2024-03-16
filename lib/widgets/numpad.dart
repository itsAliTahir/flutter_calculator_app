// ignore_for_file: non_constant_identifier_names

import 'package:calculator_app/models/themedata.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class NumPad extends StatefulWidget {
  const NumPad({super.key});

  @override
  State<NumPad> createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  @override
  Widget build(BuildContext context) {
    Widget buttonsRow(
        Widget ButtonA, Widget ButtonB, Widget ButtonC, Widget ButtonD) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [ButtonA, ButtonB, ButtonC, ButtonD],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonsRow(
          Button("AC", primaryColor, themeColor),
          Button("<X|", primaryColor, themeColor),
          Button("%", primaryColor, themeColor),
          Button("÷", primaryColor, themeColor),
        ),
        buttonsRow(
          Button("7", numericColor, themeColor),
          Button("8", numericColor, themeColor),
          Button("9", numericColor, themeColor),
          Button("x", primaryColor, themeColor),
        ),
        buttonsRow(
          Button("4", numericColor, themeColor),
          Button("5", numericColor, themeColor),
          Button("6", numericColor, themeColor),
          Button("-", primaryColor, themeColor),
        ),
        buttonsRow(
          Button("1", numericColor, themeColor),
          Button("2", numericColor, themeColor),
          Button("3", numericColor, themeColor),
          Button("+", primaryColor, themeColor),
        ),
        buttonsRow(
          Button("0", numericColor, themeColor),
          Button(".", numericColor, themeColor),
          Button("Q", primaryColor, themeColor),
          Button("=", Colors.white, primaryColor),
        ),
      ],
    );
  }
}
