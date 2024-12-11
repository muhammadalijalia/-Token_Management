import 'package:flutter/material.dart';

import '../../Utils/my_color.dart';


class MySmallButton extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  MySmallButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(MyColor.blue1),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(85, 45),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}