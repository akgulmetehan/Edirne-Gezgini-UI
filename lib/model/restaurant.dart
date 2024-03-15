import 'package:edirne_gezgini_ui/model/base_place.dart';


class Restaurant extends BasePlace{
  final String title;

  final String image;

  final String info;

  final String location;

  Restaurant({required this.title, required this.image, required this.info, required this.location, required super.id, required super.createdAt, required super.updatedAt});

}