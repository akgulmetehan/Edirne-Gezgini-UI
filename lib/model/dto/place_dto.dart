import '../enum/place_category.dart';

class PlaceDto {
  final String id;

  final String title;

  final String info;

  final String location;

  final String image;

  final PlaceCategory category;

  PlaceDto(
      {required this.id,
      required this.title,
      required this.info,
      required this.location,
      required this.image,
      required this.category});

  PlaceDto.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        info = map["info"],
        location = map["location"],
        image = map["image"],
        category = PlaceCategoryExtension.categoryFromString(map["category"]);
}
