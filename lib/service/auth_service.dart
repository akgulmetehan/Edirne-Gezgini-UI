import 'dart:io';

import 'package:edirne_gezgini_ui/model/dto/authentication_request_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/registration_request_dto.dart';
import 'package:edirne_gezgini_ui/util/jwt_token.dart';
import 'package:get_it/get_it.dart';

import '../model/response.dart';
import '../repository/auth_repository.dart';

class AuthService {
  final AuthRepository authRepository;

  AuthService({required this.authRepository});

  Future<Response> register(RegistrationRequestDto requestDto) async{
    final response = await authRepository.register(requestDto);

    if(response.httpStatus != HttpStatus.created) {
      return Response(response.message);
    }

    String token = response.result as String;

    return Response<String>("success", result: token);
  }

  Future<Response> login(AuthenticationRequestDto requestDto) async{
    final response = await authRepository.login(requestDto);
    //GetIt getIt = GetIt.instance;
    //JwtToken jwtToken = getIt<JwtToken>();

    if(response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    String token = response.result as String;
    //jwtToken.setToken(token);

    return Response<String>("success", result: token);
  }
}