import 'package:uuid/uuid.dart';

import '../enum/base_place_category.dart';

class CreateVisitationDto {
  final Uuid visitedPlaceId;

  final Uuid userId;

  final BasePlaceCategory category;

  final String? note;

  CreateVisitationDto({required this.visitedPlaceId, required this.userId, required this.category, this.note});
}