import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Center(
              child: AutoSizeText(
            "EDİRNE GEZGİNİ",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: constants.primaryTextColor),
          )),
          scrolledUnderElevation: 0.0,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
                height: height / 1.57,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 25, bottom: 0),
                child: buildFormField(height, width)), //signup button inside--
          ],
        ),
      ),
    );
  }

  Widget buildFormField(double height, double width) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Center(
            child: Text(
          "KAYDOL",
          style: GoogleFonts.asap(
              color: const Color.fromRGBO(126, 124, 255, 0.7),
              fontWeight: FontWeight.bold,
              fontSize: width * 0.045),
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: textField(
            "İsim",
            const Icon(
              Icons.add,
              color: Colors.cyan,
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: textField(
            "Soyisim",
            const Icon(
              Icons.add,
              color: Colors.cyan,
            )),
      ),
      Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: textField(
              "Email",
              const Icon(
                Icons.email,
                color: Colors.cyan,
              ))),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: textField(
            "Şifre",
            const Icon(
              Icons.password,
              color: Colors.cyan,
            )),
      ),
      SizedBox(
        height: height / 28,
      ),
      buildSignUpButton(),
    ]);
  }

  Widget textField(String hintText, Icon icon) {
    return TextFormField(
        cursorColor: Colors.blueAccent,
        style: const TextStyle(
          color: Colors.black54,
        ),
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: icon,
          errorStyle: const TextStyle(fontSize: 9),
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          filled: true,
          fillColor: Colors.white.withOpacity(0.80),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          isDense: true,
        ));
  }

  TextButton buildSignUpButton() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white70),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.only(left: 40, right: 40)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide.none,
          ))),
      child: Text(
        "Kaydol",
        style: TextStyle(color: constants.primaryTextColor.withOpacity(0.6)),
      ),
    );
  }
}
