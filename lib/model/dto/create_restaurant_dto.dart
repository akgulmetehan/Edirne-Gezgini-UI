class CreateRestaurantDto {
  final String title;

  final String image;

  final String info;

  final String location;

  CreateRestaurantDto(
      {required this.title,
      required this.image,
      required this.info,
      required this.location});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["title"] = title;
    map["image"] = image;
    map["info"] = info;
    map["location"] = location;

    return map;
  }
}
