import 'package:uuid/uuid.dart';

import '../enum/role.dart';

class UserDto {
  final Uuid id;

  final String name;

  final String lastName;

  final String email;

  final String phoneNumber;

  final Role role;

  UserDto({required this.id, required this.name, required this.lastName, required this.email, required this.phoneNumber, required this.role});
}