import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomRoundedButton extends StatelessWidget {
  double width;
  double height;
  VoidCallback onPressed;
  TextStyle textStyle;
  String text;
  Color color;

  MyCustomRoundedButton({
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    required this.textStyle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(color),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(width, height),
          ),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
