import 'package:calculator_app/models/themedata.dart';
import 'package:calculator_app/widgets/numpad.dart';
import 'package:calculator_app/widgets/screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: const Column(
        children: [
          Expanded(
            flex: 3,
            child: Screen(),
          ),
          Expanded(
            flex: 5,
            child: NumPad(),
          )
        ],
      ),
    );
  }
}
