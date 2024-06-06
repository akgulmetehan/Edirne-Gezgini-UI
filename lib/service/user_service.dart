import 'dart:io';

import 'package:edirne_gezgini_ui/model/dto/change_password_dto.dart';
import 'package:edirne_gezgini_ui/repository/user_repository.dart';

import '../model/dto/update_user_dto.dart';
import '../model/dto/user_dto.dart';
import '../model/response.dart';

class UserService {
  final UserRepository userRepository;

  UserService({required this.userRepository});

  Future<Response<UserDto>> getAuthenticatedUser() async {
    final response = await userRepository.getAuthenticatedUser();

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    UserDto authenticatedUser =
        UserDto.fromMap(response.result as Map<String, dynamic>);
    return Response<UserDto>("success", result: authenticatedUser);
  }

  Future<Response<String>> updateAuthenticatedUser(
      UpdateUserDto updateUserDto) async {
    final response =
        await userRepository.updateAuthenticatedUser(updateUserDto);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    return Response<String>("success");
  }

  Future<Response<String>> changePassword(
      ChangePasswordDto changePasswordDto) async {
    final response = await userRepository.changePassword(changePasswordDto);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    return Response<String>("success");
  }

  Future<Response<UserDto>> getUserById(String id) async {
    final response = await userRepository.getUserById(id);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    UserDto userDto = UserDto.fromMap(response.result as Map<String, dynamic>);
    return Response<UserDto>("success", result: userDto);
  }

  Future<Response<UserDto>> getUserByEmail(String email) async {
    final response = await userRepository.getUserByEmail(email);

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    UserDto userDto = UserDto.fromMap(response.result as Map<String, dynamic>);
    return Response<UserDto>("success", result: userDto);
  }

  Future<Response<List<UserDto>>> getAllUsers() async {
    final response = await userRepository.getAllUsers();

    if (response.httpStatus != HttpStatus.ok) {
      return Response(response.message);
    }

    List<UserDto> userDtoList = (response.result as List<dynamic>)
        .map((item) => UserDto.fromMap(item as Map<String, dynamic>))
        .toList();

    return Response<List<UserDto>>("success", result: userDtoList);
  }

  Future<Response> updateUser(UpdateUserDto updateUserDto) async {
    final response = await userRepository.updateUser(updateUserDto);
    return Response(response.message);
  }
}
