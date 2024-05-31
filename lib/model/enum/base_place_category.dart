enum BasePlaceCategory { accommodation, place, restaurant }

extension BasePlaceCategoryExtension on BasePlaceCategory {
  static String categoryToJson(BasePlaceCategory category) {
    return category.toString().split('.').last;
  }
}
