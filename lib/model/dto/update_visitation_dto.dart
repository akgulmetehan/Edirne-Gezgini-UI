import 'package:uuid/uuid.dart';

class UpdateVisitationDto {
  final Uuid id;

  final String note;

  UpdateVisitationDto({required this.id, required this.note});
}