import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

// sorular ekranında örnek soruların çıktısını birbiri ardına almak istiyorum ve bunun için bu derleme yöntemine sahip olduğumuz yer burasıdır
class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity, // özel bir değerdir ve mümkün olduğunca genişlik kullan anlamına gelir
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The question...',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          const SizedBox(height: 30),
          AnswerButton(
            answerText: 'Answer 1.',
            onTap: () {}
          ),
          AnswerButton(
            answerText: 'Answer 2',
            onTap: () {}
          ),
          AnswerButton(
            answerText: 'Answer 3',
            onTap: () {}
          ),
        ],
      ),
    );
  }
}
