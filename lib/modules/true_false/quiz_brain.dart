
import 'package:multi_quiz/modules/true_false/question.dart';

class QuizBrain {
  int questionNumber = 0;

  final List<Question> _questions = [
    Question(
        questionText: 'Some cats are actually allergic to humans',
        checkQuestion: true),
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        checkQuestion: false),
    Question(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        checkQuestion: true),
    Question(questionText: 'A slug\'s blood is green.', checkQuestion: true),
    // Question(
    //     questionText: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
    //     checkQuestion: true),
    // Question(
    //     questionText: 'It is illegal to pee in the Ocean in Portugal.',
    //     checkQuestion: true),
    // Question(
    //     questionText:
    //         'No piece of square dry paper can be folded in half more than 7 times.',
    //     checkQuestion: false),
    // Question(
    //     questionText:
    //         'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
    //     checkQuestion: true),
    // Question(
    //     questionText:
    //         'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
    //     checkQuestion: false),
    // Question(
    //     questionText:
    //         'The total surface area of two human lungs is approximately 70 square metres.',
    //     checkQuestion: true),
    // Question(
    //     questionText: 'Google was originally called \"Backrub\".',
    //     checkQuestion: true),
    // Question(
    //     questionText:
    //         'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
    //     checkQuestion: true),
    // Question(
    //     questionText:
    //         'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
    //     checkQuestion: true),
  ];

  String getQuestionText() {
    return _questions[questionNumber].questionText;
  }

  bool getQuestionChecking() {
    return _questions[questionNumber].checkQuestion;
  }
  String getQuestionInit(){
    return _questions[0].questionText;
  }

  void nextQuestion() {
    if (questionNumber < _questions.length - 1) {
      questionNumber++;
    }
  }

  bool isFinished() {
    if (questionNumber >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void rest() {
    questionNumber = 0;
  }
}
