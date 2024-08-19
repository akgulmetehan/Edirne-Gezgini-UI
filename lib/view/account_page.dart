import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/model/dto/user_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/user_detail_type.dart';
import 'package:edirne_gezgini_ui/util/auth_credential_store.dart';
import 'package:flutter/material.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;
import 'package:get_it/get_it.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;
    final authStore = getIt<AuthCredentialStore>();
    UserDto currentUser = authStore.currentUser!;
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          title: const Text(
            "hesap",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "isim: ${currentUser.name}",
              style: const TextStyle(
                  fontSize: 24, color: constants.primaryTextColor),
            ),
            const SizedBox(width: 30),
            AutoSizeText(
              "soyisim: ${currentUser.lastName}",
              style: const TextStyle(
                  fontSize: 24, color: constants.primaryTextColor),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Row(
                children: [
                  AutoSizeText(
                    "email: ${currentUser.email}",
                    style: const TextStyle(
                        fontSize: 24, color: constants.primaryTextColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onPressed(BuildContext context, UserDetailType userDetailType,
      String initialValue) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog(userDetailType, initialValue, context);
        });
  }

  AlertDialog alertDialog(UserDetailType userDetailType, String initialValue,
      BuildContext context) {
    //build the title
    String title = "";
    switch (userDetailType) {
      case UserDetailType.nameAndLastname:
        title = "Ad Soyad";
        break;
      case UserDetailType.email:
        title = "Email";
        break;
      case UserDetailType.password:
        title = "Şifre";
        break;
    }

    //build AlertDialog
    return AlertDialog(
      title: AutoSizeText(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [textFormField(initialValue)],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            //database operations
            Navigator.pop(context);
          },
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white70),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide.none,
              ))),
          child: Text(
            "kaydet",
            style:
                TextStyle(color: constants.primaryTextColor.withOpacity(0.6)),
          ),
        ),
      ],
    );
  }

  TextFormField textFormField(String initialValue) {
    TextEditingController textEditingController =
        TextEditingController(text: "bla");
    return TextFormField(
        cursorColor: Colors.blueAccent,
        initialValue: "mete",
        style: const TextStyle(
          color: Colors.black54,
        ),
        maxLines: 1,
        controller: textEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return "girdiğiniz değer boşluk olamaz!";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.add, color: Colors.cyan),
            errorStyle: const TextStyle(fontSize: 9),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            filled: true,
            fillColor: Colors.white.withOpacity(0.80),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)),
            isDense: true,
            errorMaxLines: 1,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(5))));
  }
}
