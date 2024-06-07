import '../../model/enum/base_place_category.dart';

abstract class FavoritesEvent{}

class GetFavoriteList extends FavoritesEvent{}

class DeleteFavorite extends FavoritesEvent {
  final String favoriteId;
  final BasePlaceCategory category;
  DeleteFavorite({required this.favoriteId, required this.category});
}