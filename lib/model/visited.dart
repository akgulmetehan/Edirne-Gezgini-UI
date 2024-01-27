import 'package:edirne_gezgini_ui/model/base_place.dart';

import 'enum/base_place_category.dart';

class VisitedPlace{
  final BasePlace visitedPlace;

  final BasePlaceCategory category;

  final String? note;

  VisitedPlace({required this.visitedPlace, required this.category, this.note});
}