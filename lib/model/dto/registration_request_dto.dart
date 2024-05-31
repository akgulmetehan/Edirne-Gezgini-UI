import '../enum/role.dart';

class RegistrationRequestDto {
  final String name;

  final String lastName;

  final String email;

  final String password;

  final String phoneNumber;

  final Role role;

  RegistrationRequestDto(
      {required this.name,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phoneNumber,
      this.role = Role.user});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    map["name"] = name;
    map["lastName"] = lastName;
    map["email"] = email;
    map["password"] = password;
    map["phoneNumber"] = phoneNumber;
    map["role"] = RoleExtension.roleToJson(role);

    return map;
  }
}
