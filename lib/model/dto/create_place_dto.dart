import '../enum/place_category.dart';

class CreatePlaceDto {
  final String title;

  final String info;

  final String location;

  final String image;

  final PlaceCategory category;

  CreatePlaceDto({required this.title, required this.info, required this.location, required this.image, required this.category});
}