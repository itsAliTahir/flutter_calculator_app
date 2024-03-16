import 'package:calculator_app/models/dataprovider.dart';
import 'package:calculator_app/models/themedata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    var digitalCalculator = Provider.of<DigitalCalculator>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              digitalCalculator.solution.toString(),
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              digitalCalculator.input,
              style: TextStyle(color: numericColor, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
