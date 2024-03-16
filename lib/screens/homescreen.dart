import 'package:calculator_app/widgets/numpad.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 52, 65),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                // color: Colors.amber,
                ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              // color: Colors.blue,
              child: NumPad(),
            ),
          )
        ],
      ),
    );
  }
}
