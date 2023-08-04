import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summary;

  const QuestionSummary({required this.summary, super.key});

  Color? returnColor(Map<String, Object> data) {
    if (data['user_answer'] == data['correct_answer']) {
      return const Color.fromARGB(159, 72, 255, 16);
    } else {
      return const Color.fromARGB(185, 255, 106, 96);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summary.map((data) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: returnColor(data),
              ),
              child: Text(
                ((data['question_index'] as int) + 1).toString(),
                style: TextStyle(
                  fontFamily: GoogleFonts.aboreto.toString(),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['question'] as String,
                    style: TextStyle(
                        fontFamily: GoogleFonts.aboreto.toString(),
                        fontSize: 20,
                        color: const Color.fromARGB(227, 255, 255, 255)
                        // background: Paint(),
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your Answer        - ${(data['user_answer'] as String)}",
                    style: TextStyle(
                      //color: Color.fromARGB(255, 206, 205, 205),
                      color: returnColor(data),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Correct Answer   - ${(data['correct_answer'] as String)}",
                    style: const TextStyle(
                      color: Color.fromARGB(159, 72, 255, 16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
