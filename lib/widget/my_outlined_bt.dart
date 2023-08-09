import 'package:flutter/material.dart';

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    required this.icon,
    required this.iconColor,
    required this.bColor,
    required this.function,
    this.border = const CircleBorder(),
    super.key,
  });

  final IconData icon;

  final Color iconColor;

  final Color bColor;

  final OutlinedBorder border;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        child: Icon(icon, color: iconColor),
        onPressed: function,
        style: ButtonStyle().copyWith(
          shape: MaterialStatePropertyAll(border),
          side: MaterialStatePropertyAll(BorderSide(color: bColor)),
       padding: MaterialStatePropertyAll(EdgeInsets.all(4)) ));
  }
}
