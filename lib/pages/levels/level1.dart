import 'package:flutter/material.dart';
import 'package:multi_quiz/constants.dart';
import 'package:multi_quiz/pages/true_or_false_screen.dart';
import 'package:multi_quiz/widget/my_outlined_bt.dart';

class Level1 extends StatelessWidget {
  const Level1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [
        kL1,kL12
      ])),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyOutlineButton(
                  function: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.close,
                  iconColor: Colors.white,
                  bColor: Colors.white,
                ),
                Expanded(child: Center(child: Image.asset('assets/images/bags.png'))),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'level 2',
                  style: TextStyle(
                      fontFamily: 'SF-Pro-Text',
                      color: Colors.white54,
                      fontSize: 20),
                ),
                const Text(
                  'True Or False',
                  style: TextStyle(
                      fontFamily: 'SF-Pro-Text',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Do you feel confident?Here you\'ll challenge one of  our most of our most difficult travel questions! ',
                  style: TextStyle(
                      fontFamily: 'SF-Pro-Text',
                      color: Colors.white,
                      height: 1.3,
                      fontSize: 16),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TrueFalseQuiz(),
                            ));
                      },
                      child: const Text(
                        'Game',
                        style: TextStyle(
                            fontFamily: 'SF-Pro-Text',
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4C69E7),
                            fontSize: 18),
                      )),
                ),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
