import 'package:flutter/material.dart';

import '../constants.dart';
import 'my_outlined_bt.dart';

class MyLevelWidget extends StatelessWidget {
  const MyLevelWidget({
    required this.icon,
    required this.imageUrl,
    required this.level,
    required this.title,
    required this.colors,
    required this.function,
    super.key,
  });

  final IconData icon;

  final String title;
  final String level;

  final String imageUrl;
  final Function() function;

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: function,
          child: Container(
            margin: const EdgeInsets.only(top: 50, bottom: 20),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 36,
                  width: 36,
                  child: MyOutlineButton(
                      icon: icon,
                      iconColor: Colors.white,
                      bColor: Colors.white,
                      function: () {},
                      border: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  level,
                  style: const TextStyle(
                      fontFamily: kFontFamily,
                      color: Colors.white54,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontFamily: kFontFamily,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Image.asset('assets/images/$imageUrl', height: 100),
        ),
      ],
    );
  }
}
