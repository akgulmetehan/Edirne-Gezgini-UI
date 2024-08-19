import 'package:edirne_gezgini_ui/bloc/restaurants_bloc/restaurants_status.dart';

import '../../model/dto/restaurant_dto.dart';

class RestaurantsState {
  final RestaurantListStatus restaurantListStatus;
  List<RestaurantDto?> restaurantList;


  RestaurantsState({
    this.restaurantListStatus = const InitialRestaurantListStatus(),
    required this.restaurantList,
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