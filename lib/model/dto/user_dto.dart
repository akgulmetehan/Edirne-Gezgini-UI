import 'package:uuid/uuid.dart';

import '../enum/role.dart';

class UserDto {
  final String id;

  final String name;

  final String lastName;

  final String email;

  final String phoneNumber;

  final Role role;

  UserDto(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.role});

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
        id: map["id"],
        name: map["name"],
        lastName: map["lastName"],
        email: map["email"],
        phoneNumber: map["phoneNumber"],
        role: RoleExtension.fromString(map["role"]));
  }
}
