import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/bloc/register_bloc/register_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/register_bloc/register_event.dart';
import 'package:edirne_gezgini_ui/bloc/register_bloc/register_state.dart';
import 'package:edirne_gezgini_ui/bloc/register_bloc/register_status.dart';
import 'package:edirne_gezgini_ui/service/auth_service.dart';
import 'package:edirne_gezgini_ui/util/data_util.dart';
import 'package:edirne_gezgini_ui/widget/register_email_text_field.dart';
import 'package:edirne_gezgini_ui/widget/register_lastname_text_field.dart';
import 'package:edirne_gezgini_ui/widget/register_password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;

import '../bloc/auth_bloc/auth_cubit.dart';
import '../widget/register_name_text_field.dart';

class RegisterPage extends StatefulWidget {
  final DataUtil dataUtil;
  const RegisterPage({super.key, required this.dataUtil});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var key = GlobalKey<FormState>();
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
        body: BlocProvider<RegisterBloc>(
          create: (BuildContext context) => RegisterBloc(
              authService: context.read<AuthService>(),
              authCubit: context.read<AuthCubit>()
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                  height: height / 1.57,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 25, bottom: 0),
                  child: buildFormField(context, height, width)), //signup button inside--
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFormField(BuildContext context, double height, double width) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state)  {
        //if there is any exception, print it
        final registerStatus = state.registerStatus;
        if(registerStatus is RegisterFailed) {
          widget.dataUtil.showMessage(message: registerStatus.message, context: context);
        }
      },
      child: Form(
        key: key,
        child: Column(children: [
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
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: RegisterNameTextField(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: RegisterLastNameTextField(),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              child: RegisterEmailTextField()
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: RegisterPasswordTextField(),
          ),
          SizedBox(
            height: height / 28,
          ),
          buildSignUpButton(),
        ]),
      ),
    );
  }


  Widget buildSignUpButton() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            context.read<RegisterBloc>().add(RegisterSubmitted());
          },
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white70),
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.only(left: 40, right: 40)),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
    );
  }
}
