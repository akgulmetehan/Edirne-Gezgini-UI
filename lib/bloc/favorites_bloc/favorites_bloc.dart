import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_event.dart';
import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_state.dart';
import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_status.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/service/favorite_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/dto/favorite_dto.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoriteService favoriteService;

  FavoritesBloc({required this.favoriteService}) : super(FavoritesState()) {
    on<GetFavoriteList>((event, emit) async {
      //if the last status is a failed delete request, don't have to call database
      if(state.favoritesStatus.toString() == "DeleteFavoriteFailed") {
         emit(state.copyWith(favoritesStatus: GetFavoriteListSuccess()));
         return;
      }

      emit(state.copyWith(favoritesStatus: GetFavoriteListPending()));

      try {
        final response = await favoriteService.getAll();

        if(response.message != "success") {
          emit(state.copyWith(favoritesStatus: GetFavoriteListFailed(message: response.message)));
        }

        final favoriteList = response.result!;
        final favoriteMap = <BasePlaceCategory, List<FavoriteDto>> {};

        //group favorites by category in map
        for (FavoriteDto favorite in favoriteList) {
          final category =  favorite.category;
          favoriteMap[category]?.add(favorite);
        }

        emit(state.copyWith(favoritesStatus: GetFavoriteListSuccess(), favoriteList: favoriteMap));

      } catch (e) {
        emit(state.copyWith(favoritesStatus: GetFavoriteListFailed(message: "something went wrong..", exception: e)));
      }
    });

    on<DeleteFavorite>((event, emit) async{
      emit(state.copyWith(favoritesStatus: DeleteFavoritePending()));

      try {
        final response = await favoriteService.deleteFavorite(event.favoriteId);

        if(response.message != "success") {
          emit(state.copyWith(favoritesStatus: DeleteFavoriteFailed(message: response.message)));
        }

        //remove the requested favorite from background list, don't have to recall database
        final currentList = state.favoriteList;
        final category = event.category;
        currentList[category]?.removeWhere((favorite) => favorite.id == event.favoriteId);

        emit(state.copyWith(favoritesStatus: DeleteFavoriteSuccess(),favoriteList: currentList));

      } catch(e) {
        emit(state.copyWith(favoritesStatus: DeleteFavoriteFailed(message: "something went wrong..", exception: e)));
      }
    });

  }
}
