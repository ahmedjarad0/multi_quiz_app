import 'package:flutter/material.dart';
import 'package:multi_quiz/modules/level.dart';
import 'package:multi_quiz/pages/levels/level1.dart';
import 'package:multi_quiz/pages/multiple_q_screen.dart';
import 'package:multi_quiz/widget/my_outlined_bt.dart';

import '../constants.dart';
import '../widget/my_level_widget.dart';
import 'levels/level2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          SizedBox(
            height: 44,
            width: 44,
            child: MyOutlineButton(
                icon: Icons.favorite,
                iconColor: kBlueIcon,
                bColor: kGreyFont.withOpacity(0.5),
                function: () {}),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 44,
            width: 44,
            child: MyOutlineButton(
                icon: Icons.person,
                iconColor: kBlueIcon,
                bColor: kGreyFont.withOpacity(0.5),
                function: () {}),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Let\'s Play',
                style: TextStyle(
                    fontFamily: kFontFamily,
                    color: kRedFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 8,
              ),
              const Text(
                'Be the first !',
                style: TextStyle(
                    fontFamily: kFontFamily, color: kGreyFont, fontSize: 18),
              ),
              MyLevelWidget(
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Level1(),
                        ));
                  },
                  level: 'level 1',
                  icon: Icons.check,
                  imageUrl: 'bags.png',
                  title: 'True Or False',
                  colors: const [kL1, kL12]),
              MyLevelWidget(
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Level2(),
                        ));
                  },
                  level: 'level 2',
                  icon: Icons.play_arrow,
                  imageUrl: 'ballon-s.png',
                  title: 'Multiple Choice',
                  colors: const [kL2, kL22]),
              MyLevelWidget(
                  function: () {},
                  level: 'level 3',
                  icon: Icons.shop,
                  imageUrl: 'camera.png',
                  title: 'Experienced',
                  colors: [kL3, kL32]),
            ],
          ),
        ),
      ),
    );
  }
}
