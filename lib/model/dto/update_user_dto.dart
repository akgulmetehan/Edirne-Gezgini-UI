import 'package:uuid/uuid.dart';

class UpdateUserDto {
  final String id;

  final String name;

  final String lastName;

  final String email;

  final String phoneNumber;

  UpdateUserDto(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.email,
      required this.phoneNumber});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["id"] = id;
    map["name"] = name;
    map["lastName"] = lastName;
    map["email"] = email;
    map["phoneNumber"] = phoneNumber;

    return map;
  }
}
