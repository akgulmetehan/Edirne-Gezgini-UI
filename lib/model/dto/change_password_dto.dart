import 'package:uuid/uuid.dart';

class ChangePasswordDto {
  final String id;

  final String oldPassword;

  final String newPassword;

  ChangePasswordDto(
      {required this.id, required this.oldPassword, required this.newPassword});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["id"] = id;
    map["oldPassword"] = oldPassword;
    map["newPassword"] = newPassword;

    return map;
  }
}
