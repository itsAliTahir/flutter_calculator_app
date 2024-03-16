import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../models/themedata.dart';

class Button extends StatefulWidget {
  String text;
  Color textColor;
  Color backgroundColor;
  Button(String this.text, Color this.textColor, Color this.backgroundColor,
      {super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool istapped = false;
  String pressedButton = " ";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    print(screenWidth);
    print(screenHeight);
    return Bounceable(
      onTap: () {},
      onTapDown: (p0) {
        setState(() {
          istapped = true;
          pressedButton = widget.text;
        });
      },
      onTapUp: (p0) {
        setState(() {
          istapped = false;
          pressedButton = " ";
        });
      },
      child: Container(
        width: screenHeight / 2 < screenWidth
            ? (screenHeight / 2) * 0.2 - 5
            : screenWidth * 0.2 - 5,
        height: screenHeight / 2 < screenWidth
            ? (screenHeight / 2) * 0.2 - 5
            : screenWidth * 0.2 - 5,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(9),
            boxShadow: istapped && pressedButton == widget.text
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
                            fontSize: widget.text == "AC" ? 18 : 20,
                            fontWeight: FontWeight.w400),
                      )),
      ),
    );
  }
}
