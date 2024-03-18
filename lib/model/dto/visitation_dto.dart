import 'package:uuid/uuid.dart';

import '../enum/base_place_category.dart';

class VisitationDto {
  final Uuid id;

  final Uuid visitedPlaceId;

  final Uuid userId;

  final BasePlaceCategory category;

  final String? note;

  VisitationDto({required this.id, required this.visitedPlaceId, required this.userId, required this.category, this.note});
}