import '../enum/accommodation_category.dart';

class CreateAccommodationDto {
  final String title;

  final String image;

  final String info;

  final String location;

  final AccommodationCategory category;

  CreateAccommodationDto({required this.title, required this.image, required this.info, required this.location, required this.category});
}