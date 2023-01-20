import 'package:Tutora/pages/student/quiz/NextButton.dart';
import 'package:Tutora/pages/student/quiz/OptionWidget.dart';
import 'package:Tutora/pages/student/quiz/questionModel.dart';
import 'package:Tutora/pages/student/quiz/quizModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './constants.dart';

class quizHomepage extends StatefulWidget {
  const quizHomepage({Key? key}) : super(key: key);

  @override
  State<quizHomepage> createState() => _quizHomepageState();
}

class _quizHomepageState extends State<quizHomepage> {
  List<Question> _questions = [
    Question(
        id: '1',
        title: "What is the order",
        options: {"5": false, "6": false, "7": false, "1": true}),
    Question(
        id: '2',
        title: "What is the order",
        options: {"2": true, "6": false, "7": false, "1": false}),
    Question(
        id: '3',
        title: "What is the order",
        options: {"1": false, "2": false, "3": true, "1": false}),
  ];
  int index = 0;
  int score = 0;
  bool isPressed = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "You have to select an option",
          ),
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }

  void checkAnsAndUpdate(bool value) {
    if (value == true) {
      score++;
      setState(() {
        isPressed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        actions: [
          Text(
            "Score:$score",
            style: TextStyle(fontSize: 18),
          )
        ],
        title: Text("Quiz App"),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              questionWidget(
                  indexAction: index,
                  question: _questions[index].title,
                  totalQuestions: _questions.length),
              Divider(
                color: neutral,
              ),
              SizedBox(
                height: 10,
              ),
              for (int i = 0; i < _questions.length; i++)
                GestureDetector(
                  onTap: (() => checkAnsAndUpdate(
                      _questions[index].options.values.toList()[i])),
                  child: OptionWidget(
                    option: _questions[index].options.keys.toList()[i],
                    color: isPressed
                        ? _questions[index].options.values.toList()[i] == true
                            ? correct
                            : incorrect
                        : neutral,
                  ),
                )
            ],
          ),
        ),
      ),
      floatingActionButton: NextButton(nextQuestion: nextQuestion),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
