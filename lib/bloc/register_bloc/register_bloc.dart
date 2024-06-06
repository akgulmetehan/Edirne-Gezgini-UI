import 'package:edirne_gezgini_ui/bloc/register_bloc/register_event.dart';
import 'package:edirne_gezgini_ui/bloc/register_bloc/register_state.dart';
import 'package:edirne_gezgini_ui/bloc/register_bloc/register_status.dart';
import 'package:edirne_gezgini_ui/model/dto/registration_request_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/auth_service.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState> {
  final AuthService authService;

  RegisterBloc({required this.authService})
      : super(RegisterState()) {

    on<RegisterNameChanged>((event,emit) {
      emit(state.copyWith(name: event.name));
    });

    on<RegisterLastNameChanged>((event,emit) {
      emit(state.copyWith(lastName: event.lastName));
    });

    on<RegisterEmailChanged>((event,emit) {
      emit(state.copyWith(email: event.email));
    });

    on<RegisterPasswordChanged>((event,emit) {
      emit(state.copyWith(password: event.password));
    });

    on<RegisterSubmitted>((event,emit) async {
      emit(state.copyWith(registerStatus: RegisterPending()));

      try{
        final registrationRequest = RegistrationRequestDto(
            name: state.name!,
            lastName: state.lastName!,
            email: state.email!,
            password: state.password!,
            phoneNumber: "");

        final response = await authService.register(registrationRequest);
        final registerMessage = response.message;

        if(registerMessage != "success") {
          emit(state.copyWith(registerStatus: RegisterFailed(message: registerMessage)));
        }

        emit(state.copyWith(registerStatus: RegisterSuccess()));

      } catch (e) {
        emit(state.copyWith(registerStatus: RegisterFailed(message: "something went wrong..", exception: e)));
      }
    });
  }
}