import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_status.dart';

import '../../model/dto/favorite_dto.dart';
import '../../model/enum/base_place_category.dart';

class FavoritesState {
  final FavoritesStatus favoritesStatus;
  final Map<BasePlaceCategory, List<FavoriteDto>> favoriteList;

  FavoritesState({
    this.favoritesStatus = const InitialFavoritesStatus(),
    this.favoriteList = const {}
  });

  FavoritesState copyWith({
    FavoritesStatus? favoritesStatus,
    Map<BasePlaceCategory, List<FavoriteDto>>? favoriteList
  }) {
    return FavoritesState(
        favoritesStatus: favoritesStatus ?? this.favoritesStatus,
        favoriteList: favoriteList ?? this.favoriteList);
  }
}
