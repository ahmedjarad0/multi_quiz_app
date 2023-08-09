import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:multi_quiz/modules/multi_choice/quizBrainMultiple.dart';
import 'package:multi_quiz/widget/my_outlined_bt.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MultiQScreen extends StatefulWidget {
  const MultiQScreen({Key? key}) : super(key: key);

  @override
  State<MultiQScreen> createState() => _MultiQScreenState();
}

class _MultiQScreenState extends State<MultiQScreen> {
  int counter = 10;
  List<Icon> scoreAnswer = [];
  late Timer _timer;
  int? userChoice;
  bool? isCorrect;

  QuizBrainMultiple quizBrainMultiple = QuizBrainMultiple();

  void next() {
    if (quizBrainMultiple.isFinished()) {
      print('finished');
      cancelTimer();
      alterFinished();
    }  else {
      counter = 10;
      startTimer();
    }
    setState(() {
      isCorrect = null;
      userChoice = null;
      quizBrainMultiple.nextQuestion();
    });
  }

  void cancelTimer() {
    _timer.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
      });
      if (counter == 0) {
        next();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  @override
  void checkAnswer() {
    int check = quizBrainMultiple.getQuestionAnswer();
    cancelTimer();
    setState(() {
      if (check == userChoice) {
        isCorrect = true;
        scoreAnswer.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        isCorrect = false;
        scoreAnswer.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    });
    if (quizBrainMultiple.isFinished()) {
      cancelTimer();
      Timer(const Duration(seconds: 1), () {
        alterFinished();
        setState(() {
          quizBrainMultiple.rest();
          scoreAnswer.clear();
          isCorrect = null;
          userChoice = null;
          counter = 10;
        });
      });
    }
  }

  void alterFinished() {
    Alert(context: context, title: 'Finished', desc: 'you are done', buttons: [
      DialogButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          child: const Text('Finished'))
    ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0189EC),
      body: Padding(
        padding: const EdgeInsets.only(top: 72, right: 24, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 44,
                  width: 44,
                  child: MyOutlineButton(
                      icon: Icons.close,
                      iconColor: Colors.white,
                      bColor: Colors.white,
                      function: () {
                        Navigator.pushNamed(context, '/');
                      }),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SizedBox(
                      width: 56,
                      height: 56,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        value: counter / 10,
                        backgroundColor: const Color(0xff378DF2),
                      ),
                    ),
                    Text(
                      counter.toString(),
                      style: const TextStyle(
                          fontFamily: 'Sf-Pro-Text',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        side: const BorderSide(color: Colors.white)),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.white),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '3',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Sf-Pro-Text',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
                child:
                    Center(child: Image.asset('assets/images/ballon-b.png'))),
            const SizedBox(
              height: 25,
            ),
            Text(
                'question ${quizBrainMultiple.questionNumber + 1} of ${quizBrainMultiple.getLengthQuiz()}',
                style: const TextStyle(
                    color: Colors.white54,
                    fontFamily: 'SF-Pro-Text',
                    fontSize: 22)),
            const SizedBox(
              height: 10,
            ),
            Text(quizBrainMultiple.getQuestionText(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF-Pro-Text',
                    fontSize: 30)),
            Expanded(
              flex: 2,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: quizBrainMultiple.getOptions().length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: ElevatedButton(
                        onPressed: userChoice == null
                            ? () {
                                userChoice = index;
                                checkAnswer();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: isCorrect == null
                              ? Colors.white54
                              : isCorrect! && userChoice == index
                                  ? Colors.lightGreen
                                  : userChoice == index
                                      ? Colors.red
                                      : Colors.white54,
                          backgroundColor: isCorrect == null
                              ? Colors.white
                              : isCorrect! && userChoice == index
                                  ? Colors.lightGreen
                                  : userChoice == index
                                      ? Colors.red
                                      : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Center(
                                    child: Text(
                              quizBrainMultiple.getOptions()[index],
                              style: const TextStyle(
                                  fontFamily: 'SF-Pro-Text',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff4C69E7),
                                  fontSize: 18),
                            ))),
                            const Icon(
                              Icons.check,
                              color: Color(0xff4C69E7),
                            ),
                          ],
                        )),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  next();
                });
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              children: scoreAnswer,
            ),
          ],
        ),
      ),
    );
  }
}
