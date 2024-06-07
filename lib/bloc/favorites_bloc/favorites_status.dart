class FavoritesStatus {
  const FavoritesStatus();
}

class InitialFavoritesStatus extends FavoritesStatus {
  const InitialFavoritesStatus();
}

class GetFavoriteListPending extends FavoritesStatus{}

class GetFavoriteListSuccess extends FavoritesStatus{}

class GetFavoriteListFailed extends FavoritesStatus{
  final String message;
  final Object? exception;
  GetFavoriteListFailed({required this.message, this.exception});
}

class DeleteFavoritePending extends FavoritesStatus{}

class DeleteFavoriteSuccess extends FavoritesStatus{}

class DeleteFavoriteFailed extends FavoritesStatus {
  final String message;
  final Object? exception;

  DeleteFavoriteFailed({required this.message, this.exception});
}