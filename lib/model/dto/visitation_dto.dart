import '../enum/base_place_category.dart';

class VisitationDto {
  final String id;

  final String visitedPlaceId;

  final String userId;

  final BasePlaceCategory category;

  final String? note;

  VisitationDto(
      {required this.id,
      required this.visitedPlaceId,
      required this.userId,
      required this.category,
      this.note});

  VisitationDto.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        visitedPlaceId = map["visitedPlaceId"],
        userId = map["userId"],
        category = BasePlaceCategoryExtension.categoryFromString(map["category"]),
        note = map["note"];
}
