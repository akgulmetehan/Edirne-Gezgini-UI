import 'package:uuid/uuid.dart';

class UpdateRestaurantDto {
  final String id;

  final String title;

  final String image;

  final String info;

  final String location;

  UpdateRestaurantDto(
      {required this.id,
      required this.title,
      required this.image,
      required this.info,
      required this.location});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["id"] = id;
    map["title"] = title;
    map["image"] = image;
    map["info"] = info;
    map["location"] = location;

    return map;
  }
}
