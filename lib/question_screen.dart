import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer, });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}


class _QuestionScreenState extends State<QuestionScreen> {
  var currenQuestionIndex = 0;

  // answer butonlarından birine basıldığında çalıştırılır
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);  // onSelectAnswer QuestionScreen içinde olduğu için State sınıfı içinde widget anahtar sözcüğü ile kullanabilirim
    setState(() { // setState fonksiyonu, flutter'a build metodunun tekrar çalışması gerektiğini söyler
      currenQuestionIndex++; // sorular bitene kadar bu soru indeksini artırmaya devam etmedğimizden emin olmamız gereken yer burası
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
          crossAxisAlignment : CrossAxisAlignment.stretch, // tüm sütun genişliğini doldurur
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
              return AnswerButton(
                answerText: answer, 
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
