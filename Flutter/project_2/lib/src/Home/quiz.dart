import 'package:flutter/material.dart';
import 'package:project2/src/Questions/questions_screen.dart';
import 'package:project2/src/Results/result_screen.dart';
import 'package:project2/src/Home/startscreen.dart';
import 'package:project2/data/quiz_questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  late Widget activeScreen;
  final List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen2(startQuiz: switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (questions.length == selectedAnswers.length) {
      setState(() {
        activeScreen = ResultScreen(chosenAnswers: selectedAnswers,restartQuiz);
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = StartScreen2(startQuiz: switchScreen);
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: activeScreen,
      ),
    );
  }
}
