abstract class RestaurantsEvent{}

class GetRestaurantList extends RestaurantsEvent{}

class DeleteRestaurant extends RestaurantsEvent {
  final String id;
  DeleteRestaurant({required this.id});
}