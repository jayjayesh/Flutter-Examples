import 'package:day_07_12_ui_quiz_app/constants.dart';
import 'package:day_07_12_ui_quiz_app/quiz_manager.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizManager quizManagerObject = QuizManager();

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  void checkAnswer({bool userSelectedAnswer}) {
    if (quizManagerObject.isQuizFinished() == true) {
      //Future.delayed(const Duration(seconds: 2), () {
      showAlertYouFinishedQuizAndResetQuiz();
      //});
    } else {
      setState(() {
        quizManagerObject.addItemInsideReportCard(
            clickedButton: userSelectedAnswer);
      });
    }
  }

  void showAlertYouFinishedQuizAndResetQuiz() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Finished",
      desc: quizManagerObject.getYourScore(),
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              quizManagerObject.resetQuiz();
            });
          },
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
          //color: Colors.grey[900],
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        quizManagerObject.getQuestionText(),
                        style: kQuestionTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: FlatButton(
                    color: Colors.green,
                    child: Text(
                      'True',
                      style: kAnswerButtonTitleTextStyle,
                    ),
                    onPressed: () {
                      checkAnswer(userSelectedAnswer: true);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: FlatButton(
                    color: Colors.red,
                    child: Text(
                      'False',
                      style: kAnswerButtonTitleTextStyle,
                    ),
                    onPressed: () {
                      checkAnswer(userSelectedAnswer: false);
                    },
                  ),
                ),
              ),
              Wrap(
                children: quizManagerObject.getReportCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
