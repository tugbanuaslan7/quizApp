import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summryData, {super.key});

  final List<Map<String, Object>> summryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView( // child'ı kaydırılabilir duruma getirir
        child: Column(
          children: summryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(), // map tarafından üretilen sonuçta, iterable nesneyi listeye çağırıyoruz
        ),
      ),
    );
  }
}

