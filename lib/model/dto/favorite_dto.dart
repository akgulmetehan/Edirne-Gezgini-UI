import 'package:uuid/uuid.dart';

import '../enum/base_place_category.dart';

class FavoriteDto {
  final Uuid id;

  final Uuid favoritePlaceId;

  final Uuid userId;

  final BasePlaceCategory category;

  FavoriteDto({required this.id, required this.favoritePlaceId, required this.userId, required this.category});
}