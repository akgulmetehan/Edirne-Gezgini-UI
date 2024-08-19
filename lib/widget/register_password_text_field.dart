import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc/register_bloc.dart';
import '../bloc/register_bloc/register_event.dart';
import '../bloc/register_bloc/register_state.dart';

class RegisterPasswordTextField extends StatelessWidget {
  const RegisterPasswordTextField({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc,RegisterState>(builder: (context, state) {
      return TextFormField(
          cursorColor: Colors.blueAccent,
          style: const TextStyle(
            color: Colors.black54,
          ),
          maxLines: 1,
          onChanged: (value){
            context.read<RegisterBloc>().add(RegisterPasswordChanged(password: value));
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.password,
                color: Colors.cyan,
              ),
              errorStyle: const TextStyle(fontSize: 9),
              hintText: "password",
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
    });
  }
}