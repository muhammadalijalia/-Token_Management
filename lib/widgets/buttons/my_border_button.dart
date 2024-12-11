import 'package:flutter/material.dart';

import '../../Utils/my_color.dart';

class MyBorderButton extends StatelessWidget {
  VoidCallback onPressed;
  String? text;
  double? width;

  MyBorderButton({required this.onPressed, this.text, this.width});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Set the desired border radius
            side: BorderSide(
                color: MyColor.blue1), // Set the desired border color
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(MyColor.white1),
        foregroundColor: MaterialStateProperty.all<Color>(MyColor.blue1),
        fixedSize: MaterialStateProperty.all<Size>(
           Size(width ?? size.width, 40),
        ),
      ),
      child: Text(
        text ?? 'REGISTER',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
