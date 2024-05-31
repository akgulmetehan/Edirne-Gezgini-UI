import 'package:uuid/uuid.dart';

import '../enum/base_place_category.dart';

class CreateVisitationDto {
  final String visitedPlaceId;

  final String userId;

  final BasePlaceCategory category;

  final String? note;

  CreateVisitationDto(
      {required this.visitedPlaceId,
      required this.userId,
      required this.category,
      this.note});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["visitedPlaceId"] = visitedPlaceId;
    map["userId"] = userId;
    map["category"] = BasePlaceCategoryExtension.categoryToJson(category);
    map["note"] = note;

    return map;
  }
}
