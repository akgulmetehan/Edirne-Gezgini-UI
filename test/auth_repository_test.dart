import 'package:edirne_gezgini_ui/model/dto/authentication_request_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/registration_request_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/role.dart';
import 'package:edirne_gezgini_ui/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final authRepository = AuthRepository();

  final registrationRequestDto = RegistrationRequestDto(
      name: "metehan",
      lastName: "akgul",
      email: "mete.055@hotmail.com",
      password: "123456789",
      phoneNumber: "4443332211",
      role: Role.admin
      );

  final authenticationRequestDto = AuthenticationRequestDto(
      email: registrationRequestDto.email,
      password: registrationRequestDto.password);

  group("auth-repository test", () {
    test("register endpoint", () async {
      final response = await authRepository.register(registrationRequestDto);

      expect(response.httpStatus, 201);
    });

    test("login endpoint", () async{
      final response = await authRepository.login(authenticationRequestDto);

      expect(response.httpStatus, 200);
    });
  });
}