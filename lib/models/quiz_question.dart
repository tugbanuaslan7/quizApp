class QuizQuestion {
  const QuizQuestion(this.text, this.answers);  // farklı metinlere ve farklı quiz sorusu nesneleri oluşturabilmemiz için bir constructor

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); // yeni bir liste oluşturduk ve bu listeyi shuffledList değişkenine atadık (final sadece değişkeni yeniden atayamayacağınızı gösterir)
    shuffledList.shuffle(); // bellekteki mevcut liste nesnesine ulaşır ve bu listedeki ögeleri düzenler. listenin üzerine yazmaz
    // shuffledList = ['Hello']; ---> shuffledList'i burada yeni bir listeye atayamam (final yüzünden işe yaramıyor)
    return shuffledList;
  
  }
}