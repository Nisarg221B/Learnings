import 'package:flutter/material.dart';
import 'package:project2/src/Questions/anwer_button.dart';
import 'package:project2/data/quiz_questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  int currQuestion = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
      currQuestion += 1;
    });
    widget.onSelectAnswer(selectedAnswer);
  }

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
        // wiht Sizedbox
        // using size box insted of Center
        // width: double.infinity,
        child: Container(
          width: 400,
          // color: Colors.red,
          // margin: const EdgeInsets.all(100),
          padding: const EdgeInsets.all(50),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questions[currQuestion].text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...questions[currQuestion].getShuffledAnswer().map((item) {
                return AnswerButton(
                  text: item,
                  onPress: () {
                    answerQuestion(item);
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
