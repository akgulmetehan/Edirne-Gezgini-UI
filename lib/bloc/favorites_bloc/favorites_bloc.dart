import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_event.dart';
import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_state.dart';
import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_status.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/service/favorite_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/dto/accommodation_dto.dart';
import '../../model/dto/favorite_dto.dart';
import '../../model/dto/place_dto.dart';
import '../../model/dto/restaurant_dto.dart';
import '../../service/accommodation_service.dart';
import '../../service/place_service.dart';
import '../../service/restaurant_service.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoriteService favoriteService;
  final PlaceService placeService;
  final RestaurantService restaurantService;
  final AccommodationService accommodationService;

  FavoritesBloc(
      {required this.placeService,
      required this.restaurantService,
      required this.accommodationService,
      required this.favoriteService})
      : super(FavoritesState(favoriteList: {}, accommodationList: {}, placeList: {}, restaurantList: {})) {
    on<GetFavoriteList>((event, emit) async {
      //if the last status is a failed delete request, don't have to call database
      if (state.favoritesStatus.toString() == "DeleteFavoriteFailed") {
        emit(state.copyWith(favoritesStatus: GetFavoriteListSuccess()));
        return;
      }

      emit(state.copyWith(favoritesStatus: GetFavoriteListPending()));

      try {
        final favoritesResponse = await favoriteService.getAll();
        final restaurantResponse = await restaurantService.getAll();
        final placeResponse = await placeService.getAll();
        final accommodationResponse =
            await accommodationService.getAllAccommodations();

        final favoriteList = favoritesResponse.result;
        Map<BasePlaceCategory, List<FavoriteDto?>> currentFavoritesList = {};
        currentFavoritesList[BasePlaceCategory.restaurant] = [];
        currentFavoritesList[BasePlaceCategory.accommodation] = [];
        currentFavoritesList[BasePlaceCategory.place] = [];
        Map<String, RestaurantDto> restaurantList = {};
        Map<String, PlaceDto> placeList = {};
        Map<String, AccommodationDto> accommodationList = {};

        if (favoritesResponse.message != "success") {
          emit(state.copyWith(
              favoritesStatus:
                  GetFavoriteListFailed(message: favoritesResponse.message)));
        }

        for (FavoriteDto favoriteDto in favoriteList!) {
          final category = favoriteDto.category;
          final favoritePlaceId = favoriteDto.favoritePlaceId;
          currentFavoritesList[category]!.add(favoriteDto);

          switch (category) {
            case BasePlaceCategory.accommodation:
              if(accommodationResponse.message == "success") {
                final accommodationDto = accommodationResponse.result
                    ?.firstWhere((accommodation) => accommodation.id == favoritePlaceId);

                accommodationList[favoritePlaceId] = accommodationDto!;
              }
              break;

            case BasePlaceCategory.place:
              if(placeResponse.message == "success") {
                final placeDto = placeResponse.result
                    ?.firstWhere((place) => place.id == favoritePlaceId);

                placeList[favoritePlaceId] = placeDto!;
              }
              break;

            case BasePlaceCategory.restaurant:
              if(restaurantResponse.message == "success") {
                final restaurantDto = restaurantResponse.result
                    ?.firstWhere((restaurant) => restaurant.id == favoritePlaceId);

                restaurantList[favoritePlaceId] = restaurantDto!;
              }
              break;
          }
        }

        emit(state.copyWith(
            favoritesStatus: GetFavoriteListSuccess(),
            favoriteList: currentFavoritesList,
            restaurantList: restaurantList,
            placeList: placeList,
            accommodationList: accommodationList));

      } catch (e) {
        emit(state.copyWith(
            favoritesStatus: GetFavoriteListFailed(
                message: "something went wrong..", exception: e)));
      }
    });

    on<DeleteFavorite>((event, emit) async {
      emit(state.copyWith(favoritesStatus: DeleteFavoritePending()));

      try {
        final response = await favoriteService.deleteFavorite(event.favoriteId);

        if (response.message != "success") {
          emit(state.copyWith(
              favoritesStatus:
                  DeleteFavoriteFailed(message: response.message)));
        }

        //remove the requested favorite from background list, don't have to recall database
        final currentList = state.favoriteList;
        final category = event.category;
        currentList[category]
            ?.removeWhere((favorite) => favorite!.id == event.favoriteId);

        emit(state.copyWith(
            favoritesStatus: DeleteFavoriteSuccess(),
            favoriteList: currentList));
      } catch (e) {
        emit(state.copyWith(
            favoritesStatus: DeleteFavoriteFailed(
                message: "something went wrong..", exception: e)));
      }
    });
  }
}
