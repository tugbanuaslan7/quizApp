import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}


class _QuestionScreenState extends State<QuestionScreen> {
  var currenQuestionIndex = 0;

  void answerQuestion () {
    // currenQuestionIndex = currenQuestionIndex + 1;
    // currenQuestionIndex += 1;
    setState(() { // setState fonksiyonu, flutter'a build metodunun tekrar çalışması gerektiğini söyler
      currenQuestionIndex++;
    });
  }
  
  @override
  Widget build(context) {
    final currentQuestion = questions[currenQuestionIndex]; 

    return SizedBox(
      width: double.infinity, // özel bir değerdir ve mümkün olduğunca genişlik kullan anlamına gelir
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // tüm sütun genişliğini doldurur
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: answerQuestion); // answers listesini answer buttons listesine dönüştürdük
            })
          ],
        ),
      ),
    );
  }
}
