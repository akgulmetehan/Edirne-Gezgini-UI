import 'package:uuid/uuid.dart';

abstract class BasePlace{
  final Uuid? id;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  BasePlace({this.id, this.createdAt, this.updatedAt});
}