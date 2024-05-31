enum PlaceCategory { museum, historical }

extension PlaceCategoryExtension on PlaceCategory {
  static String categoryToJson(PlaceCategory category) {
    return category.toString().split('.').last;
  }
}
