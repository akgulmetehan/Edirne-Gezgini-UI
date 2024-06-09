import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/login_event.dart';
import '../bloc/login_bloc/login_state.dart';

class LoginPasswordTextField extends StatelessWidget {
  const LoginPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        cursorColor: Colors.blueAccent,
        style: const TextStyle(
          color: Colors.black54,
        ),
        maxLines: 1,
        obscureText: true,
        onChanged: (value) {
          context.read<LoginBloc>().add(LoginPasswordChanged(password: value));
        },
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
            isDense: true,
            errorMaxLines: 1,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(5))),
      );
    });
  }
}
