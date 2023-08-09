import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_quiz/modules/true_false/quiz_brain.dart';

import '../widget/my_outlined_bt.dart';

class TrueFalseQuiz extends StatefulWidget {
  const TrueFalseQuiz({Key? key}) : super(key: key);

  @override
  State<TrueFalseQuiz> createState() => _TrueFalseQuizState();
}

class _TrueFalseQuizState extends State<TrueFalseQuiz> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreAnswer = [];
 int counter = 10 ;
 late Timer _timer ;
 @override
  void initState() {
    super.initState();
    _timer =  Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter-- ;
      });
      if(counter == 0){
        quizBrain.rest();
        scoreAnswer.clear();
        counter = 10 ;
      }
    });
  }
  @override
  void checkAnswer(bool userCheck) {
    bool checked = quizBrain.getQuestionChecking();
    setState(() {
      if (checked == userCheck) {
        scoreAnswer.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreAnswer.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    });

    if (quizBrain.isFinished()) {
      Timer(const Duration(milliseconds: 500), () {
        // Alert(
        //   context: context,
        //   title: 'Finished',
        //   desc: 'you are done',
        // ).show();
        setState(() {
          quizBrain.rest();
          scoreAnswer.clear();
          counter =10 ;
        });
      });
    } else {
      quizBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0189EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 44,
                    width: 44,
                    child:MyOutlineButton(icon: Icons.close, iconColor: Colors.white, bColor: Colors.white, function: (){Navigator.pushNamed(context, '/');}),
                  ),
                   Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                       SizedBox(
                        width: 56,
                        height: 56,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          value: counter/10,
                          backgroundColor: Color(0xff378DF2),
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

              Expanded(
                  flex: 6,
                  child: Center(
                      child: Text(
                    textAlign: TextAlign.center,
                    quizBrain.getQuestionText(),
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                  ))),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('True',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        checkAnswer(false);
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text(
                        'False',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      )),
                ),
              ),
              Wrap(
                children: scoreAnswer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
