abstract class RestaurantListStatus{
  const RestaurantListStatus();
}

class InitialRestaurantListStatus extends RestaurantListStatus{
  const InitialRestaurantListStatus();
}

class GetRestaurantListPending extends RestaurantListStatus{}

class GetRestaurantListSuccess extends RestaurantListStatus{}

class GetRestaurantListFailed extends RestaurantListStatus{
  final String message;
  final Object? exception;
  GetRestaurantListFailed({required this.message, this.exception});
}

class DeleteRestaurantPending extends RestaurantListStatus{}

class DeleteRestaurantSuccess extends RestaurantListStatus{}

class DeleteRestaurantFailed extends RestaurantListStatus {
  final String message;
  final Object? exception;
  DeleteRestaurantFailed({required this.message, this.exception});
}