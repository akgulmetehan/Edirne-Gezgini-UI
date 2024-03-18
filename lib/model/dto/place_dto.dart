import 'package:uuid/uuid.dart';

import '../enum/place_category.dart';

class PlaceDto {
  final Uuid id;

  final String title;

  final String info;

  final String location;

  final String image;

  final PlaceCategory category;

  PlaceDto({required this.id, required this.title, required this.info, required this.location, required this.image, required this.category});
}