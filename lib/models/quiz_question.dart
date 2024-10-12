class QuizQuestion {
  const QuizQuestion(this.text, this.answers);  // farklı metinlere ve farklı quiz sorusu nesneleri oluşturabilmemiz için bir constructor

  final String text;
  final List<String> answers;
}