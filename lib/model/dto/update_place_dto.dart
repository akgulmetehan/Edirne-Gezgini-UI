import 'package:uuid/uuid.dart';

import '../enum/place_category.dart';

class UpdatePlaceDto {
  final String id;

  final String title;

  final String info;

  final String location;

  final String image;

  final PlaceCategory category;

  UpdatePlaceDto(
      {required this.id,
      required this.title,
      required this.info,
      required this.location,
      required this.image,
      required this.category});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["id"] = id;
    map["title"] = title;
    map["info"] = info;
    map["location"] = location;
    map["image"] = image;
    map["category"] = PlaceCategoryExtension.categoryToJson(category);

    return map;
  }
}
