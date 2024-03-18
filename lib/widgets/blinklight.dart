import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/dataprovider.dart';

class BlinkLight extends StatelessWidget {
  const BlinkLight({super.key});
  @override
  Widget build(BuildContext context) {
    var digitalCalculator = Provider.of<DigitalCalculator>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 13,
          height: 13,
          margin: const EdgeInsets.only(top: 15, left: 15),
          decoration: BoxDecoration(
              color: digitalCalculator.lightON
                  ? Colors.red
                  : const Color.fromARGB(255, 16, 18, 35),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    color: digitalCalculator.lightON
                        ? Colors.redAccent
                        : Colors.transparent,
                    blurRadius: 4),
              ]),
        ),
      ],
    );
  }
}
