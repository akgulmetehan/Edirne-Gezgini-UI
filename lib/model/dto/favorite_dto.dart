import '../enum/base_place_category.dart';

class FavoriteDto {
  final String id;

  final String favoritePlaceId;

  final String userId;

  final BasePlaceCategory category;

  FavoriteDto(
      {required this.id,
      required this.favoritePlaceId,
      required this.userId,
      required this.category});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["id"] = id;
    map["favoritePlaceId"] = favoritePlaceId;
    map["userId"] = userId;
    map["category"] = category;

    return map;
  }

  FavoriteDto.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        favoritePlaceId = map["favoritePlaceId"],
        userId = map["userId"],
        category = BasePlaceCategoryExtension.categoryFromString(map["category"]);
}
