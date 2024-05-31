import '../enum/place_category.dart';

class CreatePlaceDto {
  final String title;

  final String info;

  final String location;

  final String image;

  final PlaceCategory category;

  CreatePlaceDto(
      {required this.title,
      required this.info,
      required this.location,
      required this.image,
      required this.category});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["title"] = title;
    map["info"] = info;
    map["location"] = location;
    map["image"] = image;
    map["category"] = PlaceCategoryExtension.categoryToJson(category);

    return map;
  }
}
