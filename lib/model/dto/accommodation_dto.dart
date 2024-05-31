import 'package:uuid/uuid.dart';

import '../enum/accommodation_category.dart';

class AccommodationDto {
  final String id;

  final String title;

  final String image;

  final String info;

  final String location;

  final AccommodationCategory category;

  AccommodationDto(
      {required this.id,
      required this.title,
      required this.image,
      required this.info,
      required this.location,
      required this.category});

  factory AccommodationDto.fromMap(Map<String, dynamic> map) {
    return AccommodationDto(
        id: map["id"],
        title: map["title"],
        image: "",
        info: map["info"],
        location: map["location"],
        category: AccommodationExtension.fromString(map["category"]));
  }
}
