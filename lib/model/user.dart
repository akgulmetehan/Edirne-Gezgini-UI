import 'package:uuid/uuid.dart';

import 'enum/role.dart';

class User{
  final Uuid id;

  final String name;

  final String lastName;

  final String email;

  final String password;

  final String phoneNumber;

  final Role role;

  final DateTime createdAt;

  final DateTime updatedAt;

  User({required this.id ,required this.name, required this.lastName, required this.email, required this.password, required this.phoneNumber, required this.role ,required this.createdAt, required this.updatedAt});
}