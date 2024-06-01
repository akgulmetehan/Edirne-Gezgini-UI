import 'package:edirne_gezgini_ui/model/dto/change_password_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_user_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/user_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/role.dart';
import 'package:edirne_gezgini_ui/repository/user_repository.dart';
import 'package:edirne_gezgini_ui/service/user_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final userRepository = UserRepository();
  final userService = UserService(userRepository: userRepository);

  final authenticatedUser = UserDto(
      id: "6db0c8a2-bb39-4328-be10-6e6fe823ad34",
      name: "metehan",
      lastName: "akgül",
      email: "mete.059@hotmail.com",
      phoneNumber: "6333333323",
      role: Role.admin);

  final mockUser = UserDto(
      id: "886016cc-a333-488e-bdab-51c01fb4feeb",
      name: "metehan",
      lastName: "akgul",
      email: "mete.055@hotmail.com",
      phoneNumber: "4443332211",
      role: Role.admin);

  group("user service test", () {
    test("getAuthenticatedUser endpoint", () async {
      final response = await userService.getAuthenticatedUser();
      final result = response.result;

      expect(response.message == "success", true);
      expect(result?.id == authenticatedUser.id, true);
    });

    test("updateAuthenticatedUser endpoint", () async {
      final updateUserDto = UpdateUserDto(
          id: authenticatedUser.id,
          name: authenticatedUser.name,
          lastName: authenticatedUser.lastName,
          email: authenticatedUser.email,
          phoneNumber: "2223334455");

      final response = await userService.updateAuthenticatedUser(updateUserDto);

      expect(response.message == "success", true);
    });

    test("change password endpoint", () async {
      final changePasswordDto = ChangePasswordDto(
          id: authenticatedUser.id,
          oldPassword: "123456789",
          newPassword: "1234567890");

      final response = await userService.changePassword(changePasswordDto);

      expect(response.message == "success", true);
    });

    test("getUserById endpoint", () async {
      final response = await userService.getUserById(mockUser.id);
      final result = response.result as UserDto;

      expect(response.message == "success", true);
      expect(result.email == mockUser.email, true);
    });

    test("getUserByEmail endpoint", () async {
      final response = await userService.getUserByEmail(mockUser.email);
      final result = response.result as UserDto;

      expect(response.message == "success", true);
      expect(result.id == mockUser.id, true);
    });

    test("getAllUsers endpoint", () async {
      final response = await userService.getAllUsers();
      final result = response.result as List<UserDto>;

      expect(response.message == "success", true);
      expect(result.isNotEmpty, true);
    });
  });
}
