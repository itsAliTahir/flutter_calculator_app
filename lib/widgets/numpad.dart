// ignore_for_file: non_constant_identifier_names

import 'package:calculator_app/models/themedata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/dataprovider.dart';
import 'button.dart';

class NumPad extends StatefulWidget {
  const NumPad({super.key});

  @override
  State<NumPad> createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  @override
  Widget build(BuildContext context) {
    var digitalCalculator = Provider.of<DigitalCalculator>(context);
    Widget buttonsRow(
        Widget ButtonA, Widget ButtonB, Widget ButtonC, Widget ButtonD) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonA,
                  ButtonB,
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ButtonC, ButtonD],
              )),
        ],
      );
    }

    Widget buttonsRow2(
      Widget ButtonA,
      Widget ButtonB,
      Widget ButtonC,
    ) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonA,
                  ButtonB,
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonC,
                ],
              )),
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonsRow(
            Button("AC", Colors.redAccent, themeColor, () {
              digitalCalculator.ac();
            }),
            Button("<X|", primaryColor, themeColor, () {
              digitalCalculator.delete();
            }),
            Button("Q", primaryColor, themeColor, () {}),
            Button("÷", primaryColor, themeColor, () {
              digitalCalculator.typeInput("÷");
            }),
          ),
          buttonsRow(
            Button("7", numericColor, themeColor, () {
              digitalCalculator.typeInput("7");
            }),
            Button("8", numericColor, themeColor, () {
              digitalCalculator.typeInput("8");
            }),
            Button("9", numericColor, themeColor, () {
              digitalCalculator.typeInput("9");
            }),
            Button("×", primaryColor, themeColor, () {
              digitalCalculator.typeInput("×");
            }),
          ),
          buttonsRow(
            Button("4", numericColor, themeColor, () {
              digitalCalculator.typeInput("4");
            }),
            Button("5", numericColor, themeColor, () {
              digitalCalculator.typeInput("5");
            }),
            Button("6", numericColor, themeColor, () {
              digitalCalculator.typeInput("6");
            }),
            Button("-", primaryColor, themeColor, () {
              digitalCalculator.typeInput("-");
            }),
          ),
          buttonsRow(
            Button("1", numericColor, themeColor, () {
              digitalCalculator.typeInput("1");
            }),
            Button("2", numericColor, themeColor, () {
              digitalCalculator.typeInput("2");
            }),
            Button("3", numericColor, themeColor, () {
              digitalCalculator.typeInput("3");
            }),
            Button("+", primaryColor, themeColor, () {
              digitalCalculator.typeInput("+");
            }),
          ),
          buttonsRow2(
            Button(".", numericColor, themeColor, () {}),
            Button("0", numericColor, themeColor, () {
              digitalCalculator.typeInput("0");
            }),
            Button("=", Colors.white, primaryColor, () {
              digitalCalculator.calculateValue();
            }),
          ),
        ],
      ),
    );
  }
}
