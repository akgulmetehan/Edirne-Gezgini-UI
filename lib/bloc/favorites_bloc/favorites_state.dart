import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_status.dart';

import '../../model/dto/accommodation_dto.dart';
import '../../model/dto/favorite_dto.dart';
import '../../model/dto/place_dto.dart';
import '../../model/dto/restaurant_dto.dart';
import '../../model/enum/base_place_category.dart';

class FavoritesState {
  final FavoritesStatus favoritesStatus;
  Map<BasePlaceCategory, List<FavoriteDto?>> favoriteList;
  Map<String, AccommodationDto> accommodationList;
  Map<String, PlaceDto> placeList;
  Map<String, RestaurantDto> restaurantList;

  FavoritesState({
    this.favoritesStatus = const InitialFavoritesStatus(),
    required this.favoriteList,
    required this.accommodationList,
    required this.placeList,
    required this.restaurantList,
  });

  FavoritesState copyWith({
    FavoritesStatus? favoritesStatus,
    Map<BasePlaceCategory, List<FavoriteDto?>>? favoriteList,
    Map<String, AccommodationDto>? accommodationList,
    Map<String, PlaceDto>? placeList,
    Map<String, RestaurantDto>? restaurantList
  }) {
    return FavoritesState(
        favoritesStatus: favoritesStatus ?? this.favoritesStatus,
        favoriteList: favoriteList ?? this.favoriteList,
        accommodationList: accommodationList ?? this.accommodationList,
        placeList: placeList ?? this.placeList,
        restaurantList: restaurantList ?? this.restaurantList);
  }
}
