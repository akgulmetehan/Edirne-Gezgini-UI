import 'package:edirne_gezgini_ui/bloc/register_bloc/register_status.dart';

class RegisterState {
  final String? name;
  final String? lastName;
  final String? email;
  final String? password;
  final RegisterStatus? registerStatus;

  RegisterState(
      {this.name = "",
      this.lastName = "",
      this.email = "",
      this.password = "",
      this.registerStatus = const InitialRegisterStatus()});

  RegisterState copyWith(
      {String? name,
      String? lastName,
      String? email,
      String? password,
      RegisterStatus? registerStatus}) {
    return RegisterState(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        registerStatus: registerStatus ?? this.registerStatus);
  }
}
