import 'package:edirne_gezgini_ui/bloc/auth_bloc/session_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(UnAuthenticated());

  void showAuth() {
    emit(UnAuthenticated());
  }

  void showHomePage() {
    emit(Authenticated());
  }
}