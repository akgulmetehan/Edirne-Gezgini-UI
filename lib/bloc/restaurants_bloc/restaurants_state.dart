import 'package:edirne_gezgini_ui/bloc/restaurants_bloc/restaurants_status.dart';

import '../../model/dto/restaurant_dto.dart';

class RestaurantsState {
  final RestaurantListStatus restaurantListStatus;
  final List<RestaurantDto?> restaurantList;


  RestaurantsState({
    this.restaurantListStatus = const InitialRestaurantListStatus(),
    this.restaurantList = const []
  });

  RestaurantsState copyWith(
  {
    RestaurantListStatus? restaurantListStatus,
    List<RestaurantDto?>? restaurantList
  }) {
    return RestaurantsState(
      restaurantList: restaurantList ?? this.restaurantList,
      restaurantListStatus: restaurantListStatus ?? this.restaurantListStatus
    );
  }
}