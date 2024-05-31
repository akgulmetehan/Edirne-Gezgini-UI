import 'package:uuid/uuid.dart';

class RestaurantDto {
  final String id;

  final String title;

  final String image;

  final String info;

  final String location;

  RestaurantDto(
      {required this.id,
      required this.title,
      required this.image,
      required this.info,
      required this.location});

  RestaurantDto.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        image = map["image"],
        info = map["info"],
        location = map["location"];
}
