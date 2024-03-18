import 'package:uuid/uuid.dart';

class UpdateUserDto {
  final Uuid id;

  final String name;

  final String lastName;

  final String email;

  final String phoneNumber;

  UpdateUserDto({required this.id, required this.name, required this.lastName, required this.email, required this.phoneNumber});
}