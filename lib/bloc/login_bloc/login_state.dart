import 'package:edirne_gezgini_ui/bloc/login_bloc/login_status.dart';

class LoginState {
  final String? email;
  final String? password;
  final LoginStatus? loginStatus;

  LoginState(
      {this.email = "",
      this.password = "",
      this.loginStatus = const InitialLoginStatus()});

  LoginState copyWith(
      {String? email, String? password, LoginStatus? loginStatus}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        loginStatus: loginStatus ?? this.loginStatus);
  }
}
