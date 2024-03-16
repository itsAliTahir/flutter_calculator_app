import 'package:calculator_app/models/themedata.dart';
import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  const NumPad({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    print(screenWidth);
    print(screenHeight);
    Widget button(String text, Color textColor, Color backgroundColor) {
      return Container(
        width: screenHeight / 2 < screenWidth
            ? (screenHeight / 2) * 0.2 - 5
            : screenWidth * 0.2 - 5,
        height: screenHeight / 2 < screenWidth
            ? (screenHeight / 2) * 0.2 - 5
            : screenWidth * 0.2 - 5,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(9),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(54, 255, 255, 255),
                  offset: Offset(
                    0,
                    -1.5,
                  ),
                  blurRadius: 1),
              BoxShadow(
                  color: Color.fromARGB(184, 0, 0, 0),
                  offset: Offset(
                    0,
                    2,
                  ),
                  blurRadius: 3),
              BoxShadow(
                  color: Color.fromARGB(255, 36, 52, 65),
                  offset: Offset(
                    -1,
                    0,
                  ),
                  blurRadius: 5),
              BoxShadow(
                  color: Color.fromARGB(255, 36, 52, 65),
                  offset: Offset(
                    1,
                    0,
                  ),
                  blurRadius: 5),
            ]),
        child: Center(
            child: text == "<X|"
                ? Icon(
                    Icons.backspace_outlined,
                    color: textColor,
                    size: 20,
                  )
                : text == "Q"
                    ? Icon(
                        Icons.history,
                        color: textColor,
                        size: 20,
                      )
                    : Text(
                        text,
                        style: TextStyle(
                            color: textColor,
                            fontSize: text == "AC" ? 18 : 20,
                            fontWeight: FontWeight.w400),
                      )),
      );
    }

    Widget buttonsRow(
        Widget ButtonA, Widget ButtonB, Widget ButtonC, Widget ButtonD) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [ButtonA, ButtonB, ButtonC, ButtonD],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonsRow(
          button("AC", primaryColor, themeColor),
          button("<X|", primaryColor, themeColor),
          button("%", primaryColor, themeColor),
          button("÷", primaryColor, themeColor),
        ),
        buttonsRow(
          button("7", numericColor, themeColor),
          button("8", numericColor, themeColor),
          button("9", numericColor, themeColor),
          button("x", primaryColor, themeColor),
        ),
        buttonsRow(
          button("4", numericColor, themeColor),
          button("5", numericColor, themeColor),
          button("6", numericColor, themeColor),
          button("-", primaryColor, themeColor),
        ),
        buttonsRow(
          button("1", numericColor, themeColor),
          button("2", numericColor, themeColor),
          button("3", numericColor, themeColor),
          button("+", primaryColor, themeColor),
        ),
        buttonsRow(
          button("0", numericColor, themeColor),
          button(".", numericColor, themeColor),
          button("Q", primaryColor, themeColor),
          button("=", Colors.white, primaryColor),
        ),
      ],
    );
  }
}
