import '../enum/role.dart';

class UserDetailsDto {
  String id;

  String password;

  Role role;

  UserDetailsDto({required this.id, required this.password, required this.role});

  factory UserDetailsDto.fromMap(Map<String,dynamic> map) {
    return UserDetailsDto(
        id: map["id"],
        password: map["password"],
        role: RoleExtension.fromString(map["role"]),
    );
  }
}