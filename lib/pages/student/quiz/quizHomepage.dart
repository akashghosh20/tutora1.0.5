import 'package:Tutora/pages/localdata.dart';
import 'package:Tutora/pages/student/quiz/NextButton.dart';
import 'package:Tutora/pages/student/quiz/OptionWidget.dart';
import 'package:Tutora/pages/student/quiz/ResultBox.dart';
import 'package:Tutora/pages/student/quiz/questionModel.dart';
import 'package:Tutora/pages/student/quiz/quizMarkStore.dart';
import 'package:Tutora/pages/student/quiz/quizModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
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
        title:
            "What is the order of thgahjgfajgfhagdfh gafhfgdsahghja ahsfgahhjfhj ahdfsjhskjgfh ahfdjh",
        options: {
          "aaskfghhusdgfhgdhfghasgdhfgahjgfhg": false,
          "6": false,
          "7": false,
          "1": true
        }),
    Question(
        id: '2',
        title: "What is the order",
        options: {"2": true, "6": false, "7": false, "1": false}),
    Question(
        id: '3',
        title: "What is the order",
        options: {"10": false, "2": false, "3": true, "1": false}),
    Question(
        id: '3',
        title: "What is the order",
        options: {"50": false, "2": false, "3": true, "1": false}),
    Question(
        id: '3',
        title: "What is the order",
        options: {"50": false, "2": false, "3": true, "1": false}),
  ];
  int index = 0;
  int score = 0;
  bool isPressed = false;

  void nextQuestion() async {
    if (index == _questions.length - 1) {
      await UserSharedPreference().setQuizScore(score.toString());
      // showDialog(
      //   context: context,
      //   builder: (context) => ResultBox(
      //     result1: score,
      //     totalQuestions: _questions.length,
      //   ),
      // );
      // quizMarkStoreForm();
      Get.to(quizMarkStore());
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

  void checkAnswerAndUpdate(bool isCorrect) {
    if (isCorrect && !isPressed) {
      score++;
    }
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text("Quiz App"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: questionWidget(
                    indexAction: index,
                    question: _questions[index].title,
                    totalQuestions: _questions.length),
              ),
              Divider(
                color: Color.fromARGB(255, 255, 0, 0),
              ),
              SizedBox(
                height: 10,
              ),
              for (int i = 0; i < _questions[index].options.length; i++)
                GestureDetector(
                  onTap: () => checkAnswerAndUpdate(
                      _questions[index].options.values.toList()[i]),
                  child: OptionWidget(
                    option: _questions[index].options.keys.toList()[i],
                    color: isPressed
                        ? _questions[index].options.values.toList()[i] == true
                            ? correct
                            : incorrect
                        : neutral,
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              NextButton(nextQuestion: nextQuestion)
            ],
          ),
        ),
      ),
      // floatingActionButton: NextButton(nextQuestion: nextQuestion),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
