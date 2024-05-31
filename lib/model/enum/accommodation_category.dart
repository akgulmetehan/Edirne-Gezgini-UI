enum AccommodationCategory {
  hotel,
}

extension AccommodationExtension on AccommodationCategory {
  static AccommodationCategory fromString(String categoryString) {
    return AccommodationCategory.hotel;
  }

  static String categoryToString(AccommodationCategory category) {
    return "hotel";
  }

  static String categoryToJson(AccommodationCategory category) {
    return category.toString().split('.').last;
  }
}
