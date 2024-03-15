import 'package:edirne_gezgini_ui/model/base_place.dart';

import 'enum/accommodation_category.dart';

class Accommodation extends BasePlace{
  final String title;

  final String image;

  final String info;

  final String location;

  final AccommodationCategory category;

  Accommodation({required this.title, required this.image, required this.info, required this.location, required this.category, required super.id, required super.createdAt, required super.updatedAt});
}