import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/bloc/login_bloc/login_event.dart';
import 'package:edirne_gezgini_ui/bloc/login_bloc/login_state.dart';
import 'package:edirne_gezgini_ui/bloc/login_bloc/login_status.dart';
import 'package:edirne_gezgini_ui/service/auth_service.dart';
import 'package:edirne_gezgini_ui/service/user_service.dart';
import 'package:edirne_gezgini_ui/util/auth_credential_store.dart';
import 'package:edirne_gezgini_ui/widget/login_email_text_field.dart';
import 'package:edirne_gezgini_ui/widget/login_password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;

import '../bloc/auth_bloc/auth_cubit.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../util/data_util.dart';

class LoginPage extends StatefulWidget {
  final DataUtil dataUtil;

  const LoginPage({super.key, required this.dataUtil});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;
    final authStore = getIt<AuthCredentialStore>();
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
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
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
            authService: context.read<AuthService>(),
            authStore: authStore,
            userService: context.read<UserService>(),
            authCubit: context.read<AuthCubit>()),
        child: Container(
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "images/edirne-gezgini-logo.png",
                height: height * 20,
                width: width * 100,
                fit: BoxFit.cover,
              ),
            ),
            formField(dataUtil: widget.dataUtil, context: context),
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

  Widget formField(
      {required DataUtil dataUtil, required BuildContext context}) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final loginStatus = state.loginStatus;

        if (loginStatus is LoginFailed) {
          dataUtil.showMessage(message: loginStatus.message, context: context);
        }
      },
      child: Form(
        key: formKey,
        child: const Column(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: LoginEmailTextField()),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: LoginPasswordTextField(),
            )
          ],
        ),
      ),
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
            onPressed: () => {context.read<AuthCubit>().showSignupPage()},
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
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextButton(
        onPressed: () {
          context.read<LoginBloc>().add(LoginSubmitted());
        },
        style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.only(left: 30, right: 30)),
            backgroundColor: WidgetStateProperty.all(Colors.white70),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide.none,
            ))),
        child: Text(
          "Giriş yap",
          style: TextStyle(color: constants.primaryTextColor.withOpacity(0.6)),
        ),
      );
    });
  }
}
