import 'package:uuid/uuid.dart';

import '../enum/base_place_category.dart';

class CreateFavoriteDto {
  final String favoritePlaceId;

  final String userId;

  final BasePlaceCategory category;

  CreateFavoriteDto(
      {required this.favoritePlaceId,
      required this.userId,
      required this.category});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["favoritePlaceId"] = favoritePlaceId;
    map["userId"] = userId;
    map["category"] = BasePlaceCategoryExtension.categoryToJson(category);

    return map;
  }
}
