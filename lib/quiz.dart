import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });

  }

  
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = const QuestionScreen();
    }
    
    return MaterialApp(

      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // screenWidget'ında depolanan değer child argümaına bir değer olarak aktarılır.
          child: screenWidget,    
        ),
      ),
    );
  }
}