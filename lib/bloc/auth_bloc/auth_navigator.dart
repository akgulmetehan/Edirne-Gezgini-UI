import 'package:edirne_gezgini_ui/bloc/auth_bloc/auth_cubit.dart';
import 'package:edirne_gezgini_ui/bloc/auth_bloc/auth_state.dart';
import 'package:edirne_gezgini_ui/util/data_util.dart';
import 'package:edirne_gezgini_ui/view/login_page.dart';
import 'package:edirne_gezgini_ui/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              MaterialPage(child: LoginPage(dataUtil: DataUtil(),)),

              if(state == AuthState.signup)
                const MaterialPage(child: RegisterPage())
            ],

            onPopPage: (route, result) {
              return route.didPop(result);
            },
          );
        }
    );
  }
}