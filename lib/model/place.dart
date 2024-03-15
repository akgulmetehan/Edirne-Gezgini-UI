import 'package:edirne_gezgini_ui/model/base_place.dart';

import 'enum/place_category.dart';

class Place extends BasePlace{
  final String title;

  final String? info;

  final String location;

  final String image;

  final PlaceCategory category;

  Place({required this.title, required this.image, required this.category, this.info, required this.location, required super.id, required super.createdAt, required super.updatedAt});
}