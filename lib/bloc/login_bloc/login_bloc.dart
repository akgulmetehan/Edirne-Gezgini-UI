import 'package:edirne_gezgini_ui/bloc/auth_bloc/auth_cubit.dart';
import 'package:edirne_gezgini_ui/bloc/login_bloc/login_event.dart';
import 'package:edirne_gezgini_ui/bloc/login_bloc/login_state.dart';
import 'package:edirne_gezgini_ui/bloc/login_bloc/login_status.dart';
import 'package:edirne_gezgini_ui/model/dto/authentication_request_dto.dart';
import 'package:edirne_gezgini_ui/service/auth_service.dart';
import 'package:edirne_gezgini_ui/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/dto/user_dto.dart';
import '../../util/auth_credential_store.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState> {
  final AuthService authService;
  final UserService userService;
  final AuthCubit authCubit;
  final AuthCredentialStore authStore;

  LoginBloc({required this.authService, required this.authStore, required this.userService, required this.authCubit})
      : super(LoginState()) {
    {
      on<LoginEmailChanged>((event, emit) {
        emit(state.copyWith(email: event.email));
      });

      on<LoginPasswordChanged>((event, emit) {
        emit(state.copyWith(password: event.password));
      });

      on<LoginSubmitted>((event,emit) async {
        emit(state.copyWith(loginStatus: LoginPending()));

        try {
          final authenticationRequest = AuthenticationRequestDto(
              email: state.email!,
              password: state.password!);

          //try to login
          final loginResponse = await authService.login(authenticationRequest);
          final loginMessage = loginResponse.message;

          if(loginMessage != "success") {
            emit(state.copyWith(loginStatus: LoginFailed(message: loginMessage)));
            return;
          }

          //get current user
          final getUserByEmailResponse = await userService.getUserByEmail(state.email!);
          final getUserByEmailMessage = getUserByEmailResponse.message;

          if(getUserByEmailMessage != "success") {
            emit(state.copyWith(loginStatus: LoginFailed(message: getUserByEmailMessage)));
          }

          UserDto currentUser = getUserByEmailResponse.result!;
          String token = loginResponse.result!;

          //set auth credentials

          authStore.token = token;
          authStore.currentUser = currentUser;

          emit(state.copyWith(loginStatus: LoginSuccess()));
          authCubit.showHomePage();

        } catch (e) {
          emit(state.copyWith(loginStatus: LoginFailed(message: "something went wrong..", exception: e)));
        }
      });
    }
  }
}