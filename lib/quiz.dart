import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = []; // seçilen cevapların bir listesi
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });

  }

  // selectedAnswers listesine cevap ekleyebilen bir metot
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer); // add() --> bellekteki liste nesnesine ulaşır ve bu nesneye yeni bir öge ekler

    // bu if bloğu ile seçilen cevap sayısı soru sayısına eşitse daha önce aldığımız hata yerine başlangıç ekranına dönüyoruz
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }
  
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswer,  // seçtiğimiz cevapları results screen'e aktarmalıyız
        onRestart: restartQuiz,
      );
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