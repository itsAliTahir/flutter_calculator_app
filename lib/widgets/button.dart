import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class MyButton extends StatelessWidget {
  String title;
  Color color;
  Color backgroundColor;
  Function ontap;

  MyButton(this.title, this.color, this.backgroundColor, this.ontap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    double cellSize = (screenWidth * 0.25 - 4) / 2;
    return Bounceable(
      onTap: () {
        ontap();
      },
      child: Container(
        width: cellSize,
        height: cellSize,
        color: backgroundColor,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: title == "."
                  ? 40
                  : title == "="
                      ? 28
                      : 23,
            ),
          ),
        ),
      ),
    );
  }
}
