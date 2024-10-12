import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  // constructor
  const StartScreen(this.startQuiz, 
      {super.key}); // super --> key adında bir argumanı kabul etmek ve bunu üst sınıfa iletmek için bir dart kısayolu

  // artık bu sınıfın herhangi bir yerinde, bu derleme yöntemi de dahil olmak üzere kullanılabilecek bu startQuiz değişkenine sahibiz.
  // Function argüman almıyor çünkü switchScreen da almıyor
  // startQuiz değişkeninde bir fonksiyon saklıyoruz bu nedenle bu değişkeni onPressed için bir değeer olarak kullanabiliriz
  final void Function() startQuiz;  

  @override
  Widget build(context) {
    // --> derleme yöntemi. bir widget olduğu için widget türünde değer döndürmeli
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
             'assets/images/quiz-logo.png',
             width: 300,
             color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 80),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            // Bu anonm fonksiyona bir pointer aktarıyoruz.
            // onPressed bir fonksiyon ister 
            onPressed: () {
              startQuiz(); // kendi startQuiz fonksiyonumuzu çalıştırıyoruz
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
