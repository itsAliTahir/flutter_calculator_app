import 'package:calculator_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

import '../models/dataprovider.dart';
import '../models/themedata.dart';

class ButtonsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var digitalCalculator = Provider.of<DigitalCalculator>(context);

    return Container(
      padding: const EdgeInsets.all(2.0),
      color: scaffoldColor,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
          ),
          children: [
            MyButton("AC", defaultButtonBGColor, Colors.redAccent, () {
              digitalCalculator.ac();
            }),
            MyButton("(", primaryColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("(");
            }),
            MyButton(")", primaryColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput(")");
            }),
            MyButton("÷", actionButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("÷");
            }),
            MyButton("7", numButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("7");
            }),
            MyButton("8", numButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("8");
            }),
            MyButton("9", numButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("9");
            }),
            MyButton("×", actionButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("×");
            }),
            MyButton("4", numButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("4");
            }),
            MyButton("5", numButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("5");
            }),
            MyButton("6", numButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("6");
            }),
            MyButton("-", actionButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("-");
            }),
            MyButton("1", numButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("1");
            }),
            MyButton("2", numButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("2");
            }),
            MyButton("3", numButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("3");
            }),
            MyButton("+", actionButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("+");
            }),
            MyButton(".", actionButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput(".");
            }),
            MyButton("0", numButtonColor, defaultButtonBGColor, () {
              digitalCalculator.typeInput("0");
            }),
            MyButton("del", Colors.redAccent, defaultButtonBGColor, () {
              digitalCalculator.delete();
            }),
            MyButton("=", numButtonColor, primaryColor, () {
              digitalCalculator.calculate(digitalCalculator.input);
            }),
          ],
        ),
      ),
    );
  }
}
