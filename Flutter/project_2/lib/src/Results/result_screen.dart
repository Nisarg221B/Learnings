import 'package:flutter/material.dart';
import 'package:project2/data/quiz_questions.dart';
import 'package:project2/src/Results/question_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;

  List<Map<String, Object>> initializeDynamicsOfResults() {
    final List<Map<String, Object>> summaryx = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summaryx.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].options[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summaryx;
  }

  final void Function() restartQuiz;

  const ResultScreen(this.restartQuiz,
      {super.key, required this.chosenAnswers});

  @override
  Widget build(BuildContext context) {
    final summaryData = initializeDynamicsOfResults();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return (data['correct_answer'] == data['user_answer']);
    }).length;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                      style: const TextStyle(
                        color: Color.fromARGB(227, 255, 255, 255),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            
            Container(
              height: 500,
              width: 500,
              //  color: Colors.red,
              margin: const EdgeInsets.all(50),
              child: SingleChildScrollView(
                  child: QuestionSummary(summary: summaryData)),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: restartQuiz,
                  style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(227, 255, 255, 255)),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text("Restart Quiz!"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
