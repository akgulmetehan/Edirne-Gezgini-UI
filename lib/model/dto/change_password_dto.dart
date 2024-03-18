import 'package:uuid/uuid.dart';

class ChangePasswordDto {
  final Uuid id;

  final String oldPassword;

  final String newPassword;

  ChangePasswordDto({required this.id, required this.oldPassword, required this.newPassword});
}