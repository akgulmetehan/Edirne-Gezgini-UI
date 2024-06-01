import 'package:edirne_gezgini_ui/model/dto/authentication_request_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/registration_request_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/role.dart';
import 'package:edirne_gezgini_ui/repository/auth_repository.dart';
import 'package:edirne_gezgini_ui/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final authRepository = AuthRepository();
  final authService = AuthService(authRepository: authRepository);

  final registrationRequestDto = RegistrationRequestDto(
      name: "metehan",
      lastName: "akgul",
      email: "mete.051@hotmail.com",
      password: "123456789",
      phoneNumber: "4443332211",
      role: Role.admin);

  final authenticationRequestDto = AuthenticationRequestDto(
      email: registrationRequestDto.email,
      password: registrationRequestDto.password);

  group("auth service test", () {
    test("register endpoint", () async {
      final response = await authService.register(registrationRequestDto);

      expect(response.message == "success", true);
      expect(response.result != null, true);
    });

    test("login endpoint", () async {
      final response = await authService.login(authenticationRequestDto);

      expect(response.message == "success", true);
      expect(response.result != null, true);
    });
  });
}
