import 'package:edirne_gezgini_ui/model/api_response.dart';
import 'package:edirne_gezgini_ui/model/dto/change_password_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_user_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/user_details_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/user_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/role.dart';
import 'package:edirne_gezgini_ui/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final userRepository = UserRepository();

  final mockUser = UserDto(
      id: "4dabbfc5-7fb5-4d9c-913f-b55c624a79cc",
      name: 'metehan',
      email: 'mete.057@hotmail.com',
      role: Role.admin,
      phoneNumber: "5333333333",
      lastName: '');

  final secondMockUser = UserDto(
      id: "6db0c8a2-bb39-4328-be10-6e6fe823ad34",
      name: "metehan",
      lastName: "akgül",
      email: "mete.059@hotmail.cım",
      phoneNumber: "5333749017",
      role: Role.admin);

  final mockUserDetailsDto = UserDetailsDto(
      id: "6db0c8a2-bb39-4328-be10-6e6fe823ad34",
      password: "2a\$10\$BAYl5gW6H.Oh7r/mGGrPqeFie/JbO4tbogpqayESv.xZBjneBO35G",
      role: Role.admin);

  group("user repository test", () {
    test("getUserById endpoint", () async {
      final APIResponse response = await userRepository
          .getUserById(mockUser.id);
      final UserDto userDto =
          UserDto.fromMap(response.result as Map<String, dynamic>);

      expect(userDto.id, equals(mockUser.id));
      expect(userDto.name, equals(mockUser.name));
      expect(userDto.email, equals(mockUser.email));
      expect(userDto.role, equals(mockUser.role));
      expect(userDto.phoneNumber, equals(mockUser.phoneNumber));
    });

    test("getUserByEmail endpoint", () async {
      final APIResponse response =
          await userRepository.getUserByEmail(mockUser.email);
      final UserDto userDto =
          UserDto.fromMap(response.result as Map<String, dynamic>);

      expect(userDto.id, equals(mockUser.id));
      expect(userDto.name, equals(mockUser.name));
      expect(userDto.email, equals(mockUser.email));
      expect(userDto.role, equals(mockUser.role));
      expect(userDto.phoneNumber, equals(mockUser.phoneNumber));
    });

    test("getAllUsers endpoint", () async {
      final APIResponse response = await userRepository.getAllUsers();
      final List<dynamic> result = response.result as List<dynamic>;

      expect(result.isNotEmpty, true);
    });

    test("updateUser endpoint", () async {
      final updateUserDto = UpdateUserDto(
          id: mockUser.id,
          name: mockUser.name,
          lastName: mockUser.lastName,
          email: "mete.058@hotmail.com",
          phoneNumber: mockUser.phoneNumber);

      final APIResponse response =
          await userRepository.updateUser(updateUserDto);

      expect(response.httpStatus, 200);
    });

    test("changePassword endpoint", () async {
      final ChangePasswordDto changePasswordDto = ChangePasswordDto(
          id: secondMockUser.id,
          oldPassword: "1234567890",
          newPassword: "123456789");

      final APIResponse response =
          await userRepository.changePassword(changePasswordDto);

      expect(response.httpStatus, 200);
    });

    test("getAuthenticatedUser endpoint", () async {
      final APIResponse response = await userRepository.getAuthenticatedUser();

      final result = response.result as Map<String,dynamic>;

      final userDetailsDto = UserDetailsDto.fromMap(result);

      expect(userDetailsDto.id, mockUserDetailsDto.id);
    });

    test("updateAuthenticatedUser endpoint", () async {
      final updateUserDto = UpdateUserDto(
          id: secondMockUser.id,
          name: secondMockUser.name,
          lastName: secondMockUser.lastName,
          email: secondMockUser.email,
          phoneNumber: "6333333323");

      final APIResponse response = await userRepository.updateAuthenticatedUser(updateUserDto);

      expect(200, response.httpStatus);
    });
  });
}
