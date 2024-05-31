import '../enum/accommodation_category.dart';

class CreateAccommodationDto {
  final String title;

  final String image;

  final String info;

  final String location;

  final AccommodationCategory category;

  CreateAccommodationDto(
      {required this.title,
      required this.image,
      required this.info,
      required this.location,
      required this.category});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["title"] = title;
    map["image"] = image;
    map["info"] = info;
    map["location"] = location;
    map["category"] = AccommodationExtension.categoryToString(category);

    return map;
  }
}
