import 'package:uuid/uuid.dart';

import '../enum/accommodation_category.dart';

class AccommodationDto {
  final Uuid id;

  final String title;

  final String image;

  final String info;

  final String location;

  final AccommodationCategory category;

  AccommodationDto({required this.id, required this.title, required this.image, required this.info, required this.location, required this.category});
}