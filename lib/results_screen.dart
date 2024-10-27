import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  // bir widget'ta bazı verileri almanız gerekiyorsa, bir widget'a bazı verileri aktarabilmek istiyorsanız, constructorda bir argüman almalısınız.
  const ResultsScreen({
    super.key, 
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  // results screen'de bazı bilgilerin çıktısını almak istiyorum.
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],  // ilk cevap her zaman doğru cevap olacaktır
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final summaryData = getSummaryData();  // hangi soruların doğru cevaplandığını görmek için bu verileri kullanmam gerekiyo
    final numTotalQuestions = questions.length;
    // where metodu, onu çağırdığınız listeyi filrelemenize olanak tanır. Orijinal listeyi değiştirmez, yeni bir liste döndürür.
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer']; // bu iki değer eşitse kullanıcı doğru cevabı seçmiştir.
    }).length; // doğru yanıtlanan soruların sayısını istiyoum

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
               ),
               textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            // testi tekrardan başlatmak için buton
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
