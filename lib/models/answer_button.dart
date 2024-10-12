import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key, 
    // required anahtar kelimesini ekledik çünkü dart'ta varsayılan olarak adlandırılmış argümanlar isteğe bağlıdır ancak burada, bu answer butonu doğru çalıştığından
    // emin olmak için değerlere ihtiyacımız var ve bu nedenle adlandırılmış argümanların önüne required ekleyerek bunları isteğe bağlı olmayan hale getiririz.
    // Değerler alabilirler ve değerler daha sonra this anahtar sözcüğü sayesinde aynı adlara sahip özekkiklere iletilir
    required this.answerText, 
    required this.onTap});

  final String answerText;
  final void Function() onTap; // onTap, argüman olarak aldığımız ve daha sonra ElevatedButton'a basıldığında değer olarak kullandığımız fonksiyondur.

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // butona basıldığında bir değer olarak ayarlanan bu fonksiyon da dışarıdan gelmelidir.
      // bu nedenle question screen içinden de ayarlanabilir olmalıdır.
      onPressed: onTap,  
      // stili değiştirmek için bazı argümanlar aktarmamız gerekiyor
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(answerText),
    );
  }
}
