import 'package:multi_quiz/modules/multi_choice/questionMultiple.dart';

class QuizBrainMultiple {
  int questionNumber = 0;

  final List<QuestionMultiple> _questionMultiple = <QuestionMultiple>[
    QuestionMultiple(
        questionText :'You can lead a cow down stairs but not up stairs.',
        questionAnswer: 1,
        options: ['always', 'never', 'sometimes']),
    QuestionMultiple(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        questionAnswer: 0,
        options: ['agree', 'disagree', 'not sure']),
    QuestionMultiple(
      questionText: 'Which programming language is used for Flutter development?',
      questionAnswer: 2,
      options:   ['Java', 'Swift', 'Dart'],
    ),
    QuestionMultiple(
      questionText:   'Which widget is used to create a button in Flutter?',
      questionAnswer:    1,
      options:   ['Text', 'RaisedButton', 'Image'],
    ),
  ];

  String getQuestionText() {
    return _questionMultiple[questionNumber].questionText;
  }

  int getQuestionAnswer() {
    return _questionMultiple[questionNumber].questionAnswer;
  }

  List<String> getOptions() {
    return _questionMultiple[questionNumber].options;
  }

  void nextQuestion() {
    if (questionNumber < _questionMultiple.length - 1) {
      questionNumber++;
    }
  }
 int getLengthQuiz(){
    return _questionMultiple.length;
 }
  bool isFinished() {
    if (questionNumber >= _questionMultiple.length - 1) {
      return true;
    }
    return false;
  }

  void rest() {
    questionNumber = 0;
  }
}
