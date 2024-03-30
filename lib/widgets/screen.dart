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
    String removeTrailingZero(num number) {
      String result = number.toString();
      if (result.contains('.')) {
        while (result.endsWith('0')) {
          result = result.substring(0, result.length - 1);
        }
        if (result.endsWith('.')) {
          result = result.substring(0, result.length - 1);
        }
      }
      return result;
    }

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Align(
              alignment: Alignment.bottomRight,
              child: digitalCalculator.isError
                  ? const Text(
                      "Syntax Error",
                      style: TextStyle(color: Colors.red, fontSize: 40),
                    )
                  : Text(
                      removeTrailingZero(digitalCalculator.solution),
                      style: TextStyle(color: Colors.white, fontSize: 60),
                    ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              digitalCalculator.input,
              style: TextStyle(color: numButtonColor, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
