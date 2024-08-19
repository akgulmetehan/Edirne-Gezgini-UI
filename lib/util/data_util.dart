import 'package:flutter/material.dart';

class DataUtil {

  void showMessage({required String message, required BuildContext context}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 15, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red[400],
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 40, left: 5, right: 5),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide.none,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String englishCharacterToTurkish(String text)
  {
    List<String> turkishChars = ['ı', 'ğ', 'İ', 'Ğ', 'ç', 'Ç', 'ş', 'Ş', 'ö', 'Ö', 'ü', 'Ü'];
    List<String> englishChars = ['i', 'g', 'I', 'G', 'c', 'C', 's', 'S', 'o', 'O', 'u', 'U'];

    // Match chars
    for (int i = 0; i < turkishChars.length; i++) {
      text = text.replaceAll(englishChars[i], turkishChars[i]);
    }
    return text;
  }
}