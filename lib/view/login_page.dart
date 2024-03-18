import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
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
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: width / 2.5,
                height: height / 15,
                child: Text(
                  "GİRİŞ YAP",
                  style: GoogleFonts.asap(
                      color: const Color.fromRGBO(126, 124, 255, 0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.045),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            formField(),
            //FORM FIELD
            SizedBox(
              height: height / 40,
            ),
            Center(
              child: buildSubmitButton(),
            ),
            Expanded(
              child: buildBottomPart(context, width),
            ),
          ]),
        ),
      ),
    );
  }

  Widget formField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: emailField(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: passwordField(),
        ),
      ],
    );
  }

  Widget buildBottomPart(BuildContext context, double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Hesabın yok mu?",
            style: TextStyle(color: Colors.black45),
          ),
          TextButton(
            onPressed: () => {},
            child: const Text(
              "kaydol",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ),
          SizedBox(
            width: width / 7,
          ),
          TextButton(
            onPressed: () => {},
            child: const Text(
              "şifremi unuttum",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ),
        ]),
      ],
    );
  }

  Widget buildSubmitButton() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.only(left: 30, right: 30)),
          backgroundColor: MaterialStateProperty.all(Colors.white70),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide.none,
          ))),
      child: Text(
        "Giriş yap",
        style: TextStyle(color: constants.primaryTextColor.withOpacity(0.6)),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
        cursorColor: Colors.blueAccent,
        style: const TextStyle(
          color: Colors.black54,
        ),
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.cyan,
          ),
          errorStyle: const TextStyle(fontSize: 9),
          hintText: "Email",
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

  Widget passwordField() {
    return TextFormField(
      cursorColor: Colors.blueAccent,
      style: const TextStyle(
        color: Colors.black54,
      ),
      maxLines: 1,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.password,
            color: Colors.cyan,
          ),
          errorStyle: const TextStyle(fontSize: 9),
          hintText: "Şifre",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          filled: true,
          fillColor: Colors.white.withOpacity(0.80),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          isDense: true),
    );
  }
}
