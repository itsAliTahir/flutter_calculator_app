import 'package:calculator_app/models/themedata.dart';
import 'package:calculator_app/widgets/buttonsgrid.dart';
import 'package:calculator_app/widgets/screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: Screen()),
            Container(
                height: screenWidth + ((screenWidth * 0.25)),
                child: ButtonsGrid()),
          ],
        ),
      ),
    );
  }
}
