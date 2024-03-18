import 'package:uuid/uuid.dart';

import '../enum/base_place_category.dart';

class CreateFavoriteDto {
  final Uuid favoritePlaceId;

  final Uuid userId;

  final BasePlaceCategory category;

  CreateFavoriteDto({required this.favoritePlaceId, required this.userId, required this.category});
}