import 'package:flutter/material.dart';

/*
1. Use SizedBox and provide some height:

 Column(
   children: <Widget>[
     Widget1(),
     SizedBox(height: 10), // <-- Set height
     Widget2(),
   ],
 )

2. Use Spacer

 Column(
   children: <Widget>[
     Widget1(),
     Spacer(), // <-- Spacer
     Widget2(),
   ],
 )

3. Use Expanded
 Column(
   children: <Widget>[
     Widget1(),
     Expanded(child: SizedBox.shrink()), // <-- Expanded
     Widget2(),
   ],
 )
4.Set mainAxisAlignment

 Column(
   mainAxisAlignment: MainAxisAlignment.spaceAround, // <-- alignments
   children: <Widget>[
     Widget1(),
     Widget2(),
   ],
 )

5. Use Wrap

 Wrap(
   direction: Axis.vertical, 
   spacing: 20, // <-- Spacing between children
   children: <Widget>[
     Widget1(),
     Widget2(),
   ],
 )

*/

// using wrap
class StartScreen extends StatelessWidget {

  final void Function() startQuiz;
  const StartScreen({super.key, required this.startQuiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.blue]),
      ),
      child: Center(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 90,
          children: [
            Image.asset('assets/images/quiz-logo.png', scale: 2),
            Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 40,
                children: [
                  const Text(
                    'Learn Flutter the fun way!',
                    style: TextStyle(
                      fontFamily: "Times",
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  OutlinedButton(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.fromLTRB(25, 20, 25, 20),
                      ),
                    ),
                    onPressed: startQuiz,
                    child: const Text(
                      'Start Quiz',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

// using sized box
class StartScreen2 extends StatelessWidget {
  final void Function() startQuiz;
  const StartScreen2({super.key, required this.startQuiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              scale: 2,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(height: 80),
            const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                fontFamily: "Times",
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Directionality(
              textDirection: TextDirection.rtl,
              child: OutlinedButton.icon(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.fromLTRB(25, 20, 25, 20),
                  ),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  startQuiz();
                },
                label: const Text('Start Quiz'),
                icon: const Icon(Icons.arrow_right_alt_sharp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
