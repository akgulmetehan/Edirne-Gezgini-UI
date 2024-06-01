enum BasePlaceCategory { accommodation, place, restaurant }

extension BasePlaceCategoryExtension on BasePlaceCategory {
  static String categoryToJson(BasePlaceCategory category) {
    return category.toString().split('.').last;
  }

  static BasePlaceCategory categoryFromString(String categoryString) {
    switch(categoryString) {
      case "restaurant":
        return BasePlaceCategory.restaurant;

      case "place":
        return BasePlaceCategory.place;

      default:
        return BasePlaceCategory.accommodation;
    }
  }
}
