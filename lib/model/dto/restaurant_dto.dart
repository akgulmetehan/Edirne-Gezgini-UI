import 'package:uuid/uuid.dart';

class RestaurantDto {
  final Uuid id;

  final String title;

  final String image;

  final String info;

  final String location;

  RestaurantDto({required this.id, required this.title, required this.image, required this.info, required this.location});
}