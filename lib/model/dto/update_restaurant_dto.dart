import 'package:uuid/uuid.dart';

class UpdateRestaurantDto {
  final Uuid id;

  final String title;

  final String image;

  final String info;

  final String location;

  UpdateRestaurantDto({required this.id, required this.title, required this.image, required this.info, required this.location});
}