enum PlaceCategory { museum, historical }

extension PlaceCategoryExtension on PlaceCategory {
  static String categoryToJson(PlaceCategory category) {
    return category.toString().split('.').last;
  }

  static PlaceCategory categoryFromString(String categoryString) {
    if(categoryString == "museum") {
      return PlaceCategory.museum;

    } else {
      return PlaceCategory.historical;
    }
  }
}
