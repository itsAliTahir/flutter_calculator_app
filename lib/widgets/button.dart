import 'dart:math';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';
import '../models/dataprovider.dart';
import '../models/themedata.dart';

// ignore: must_be_immutable
class Button extends StatefulWidget {
  String text;
  Color textColor;
  Color backgroundColor;
  Function onTap;
  Button(this.text, this.textColor, this.backgroundColor, this.onTap,
      {super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isShowed = false;
  String pressedButton = " ";
  int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var digitalCalculator = Provider.of<DigitalCalculator>(context);
    return DelayedDisplay(
      delay: Duration(milliseconds: generateRandomNumber(300, 1200)),
      slidingBeginOffset: const Offset(0, 0),
      child: Bounceable(
        onTap: () {
          widget.onTap();
        },
        onTapDown: (p0) {
          digitalCalculator.toggleLight(true);
          setState(() {
            pressedButton = widget.text;
          });
        },
        onTapUp: (p0) {
          setState(() {
            digitalCalculator.toggleLight(false);
            pressedButton = " ";
          });
        },
        onTapCancel: () {
          digitalCalculator.toggleLight(false);
          setState(() {
            pressedButton = " ";
          });
        },
        child: Container(
          width: widget.text == "="
              ? (2 * (screenWidth * 0.2 - 5)) + (screenWidth * 0.05)
              : screenHeight / 2 < screenWidth
                  ? (screenHeight / 2) * 0.2 - 5
                  : screenWidth * 0.2 - 5,
          height: screenHeight / 2 < screenWidth
              ? (screenHeight / 2) * 0.2 - 5
              : screenWidth * 0.2 - 5,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(9),
              boxShadow: pressedButton == widget.text
                  ? []
                  : [
                      const BoxShadow(
                          color: Color.fromARGB(54, 255, 255, 255),
                          offset: Offset(
                            0,
                            -1.5,
                          ),
                          blurRadius: 1),
                      const BoxShadow(
                          color: Color.fromARGB(184, 0, 0, 0),
                          offset: Offset(
                            0,
                            2,
                          ),
                          blurRadius: 3),
                      BoxShadow(
                          color: themeColor,
                          offset: const Offset(
                            -1,
                            0,
                          ),
                          blurRadius: 5),
                      BoxShadow(
                          color: themeColor,
                          offset: const Offset(
                            1,
                            0,
                          ),
                          blurRadius: 5),
                    ]),
          child: Center(
              child: widget.text == "<X|"
                  ? Icon(
                      Icons.backspace_outlined,
                      color: widget.textColor,
                      size: 20,
                    )
                  : widget.text == "Q"
                      ? Icon(
                          Icons.history,
                          color: widget.textColor,
                          size: 20,
                        )
                      : Text(
                          widget.text,
                          style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.text == "AC"
                                  ? 18
                                  : widget.textColor == primaryColor
                                      ? 24
                                      : 20,
                              fontWeight: FontWeight.w400),
                        )),
        ),
      ),
    );
  }
}
