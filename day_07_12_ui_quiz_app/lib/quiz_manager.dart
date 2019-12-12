import 'package:day_07_12_ui_quiz_app/Models/questionModel.dart';
import 'package:flutter/material.dart';

class QuizManager {
  int _nextQuestionNumber = 0;
  int _yourScore = 0;
  bool _isQuizFinish = false;
  List<Icon> _reportCard = [];

  List<QuestionModel> _questionBank = [
    QuestionModel('Some cats are actually allergic to humans', true),
    QuestionModel('You can lead a cow down stairs but not up stairs.', false),
    QuestionModel(
        'Approximately one quarter of human bones are in the feet.', true),
    QuestionModel('A slug\'s blood is green.', true),
    QuestionModel('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    QuestionModel('It is illegal to pee in the Ocean in Portugal.', true),
    QuestionModel(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    QuestionModel(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    QuestionModel(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    QuestionModel(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    QuestionModel('Google was originally called \"Backrub\".', true),
    QuestionModel(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    QuestionModel(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  String getQuestionText() {
    return _questionBank[_nextQuestionNumber].question;
  }

  bool getQuestionAnswer() {
    return _questionBank[_nextQuestionNumber].answer;
  }

  void showNextQuestionPlease() {
    if (_nextQuestionNumber < (_questionBank.length - 1)) {
      _nextQuestionNumber++;
    } else {
      _isQuizFinish = true;
    }
  }

  void addItemInsideReportCard({bool clickedButton}) {
    bool correctAnswer = getQuestionAnswer();

    if (clickedButton == correctAnswer) {
      _yourScore++;
      _reportCard.add(Icon(
        Icons.check_box,
        color: Colors.green,
      ));
    } else {
      _reportCard.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }

    showNextQuestionPlease();
  }

  String getYourScore() {
    String score = "Your score is " +
        _yourScore.toString() +
        '/' +
        (_questionBank.length).toString();
    return score;
  }

  List<Icon> getReportCard() {
    return _reportCard;
  }

  bool isQuizFinished() {
    return _isQuizFinish;
  }

  void resetQuiz() {
    _nextQuestionNumber = 0;
    _yourScore = 0;
    _reportCard = [];
    _isQuizFinish = false;
  }
}
