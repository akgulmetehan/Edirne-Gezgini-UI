import 'package:edirne_gezgini_ui/bloc/auth_bloc/session_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState.login);

  void showLoginPage() {
    emit(AuthState.login);
  }

  void showSignupPage() {
    emit(AuthState.signup);
  }

  void showHomePage() {
    sessionCubit.showHomePage();
  }
}