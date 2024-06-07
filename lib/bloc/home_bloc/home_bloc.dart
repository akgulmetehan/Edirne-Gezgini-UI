import 'package:edirne_gezgini_ui/bloc/home_bloc/current_user_status.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/historical_list_status.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_event.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_state.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/museum_list_status.dart';
import 'package:edirne_gezgini_ui/model/enum/place_category.dart';
import 'package:edirne_gezgini_ui/service/place_service.dart';
import 'package:edirne_gezgini_ui/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/dto/place_dto.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PlaceService placeService;
  final UserService userService;

  HomeBloc({required this.placeService, required this.userService})
      : super(HomeState()) {

    on<GetCurrentUser>((event,emit) async {
      emit(state.copyWith(currentUserStatus: GetCurrentUserPending()));

      try{
        final response = await userService.getAuthenticatedUser();
        final currentUser = response.result;

        if(response.message != "success") {
          emit(state.copyWith(currentUserStatus: GetCurrentUserFailed(message: response.message)));
        }

        emit(state.copyWith(currentUserStatus: GetCurrentUserSuccess(), currentUser: currentUser));

      }catch(e) {
        emit(state.copyWith(currentUserStatus: GetCurrentUserFailed(message: "something went wrong..", exception: e)));
      }
    });

    on<GetHistoricalList>((event,emit) async {
      emit(state.copyWith(historicalListStatus: GetHistoricalListPending()));
      PlaceCategory category = PlaceCategory.historical;

      try{
        final response = await placeService.getAllByCategory(category);

        if(response.message != "success") {
          emit(state.copyWith(historicalListStatus: GetHistoricalListFailed(message: response.message)));
        }

        final historicalList = response.result!;
        Map<PlaceCategory,List<PlaceDto>?> currentList = state.placeList;

        //group places by category "historical" in map
        for(PlaceDto place in historicalList) {
          currentList[category]?.add(place);
        }

        emit(state.copyWith(historicalListStatus: GetHistoricalListSuccess(), placeList: currentList));

      }catch(e) {
        emit(state.copyWith(historicalListStatus: GetHistoricalListFailed(message: "something went wrong..", exception: e)));
      }
    });

    on<GetMuseumList>((event,emit) async {
      emit(state.copyWith(museumListStatus: GetMuseumListPending()));
      PlaceCategory category = PlaceCategory.museum;

      try{
        final response = await placeService.getAllByCategory(category);

        if(response.message != "success") {
          emit(state.copyWith(museumListStatus: GetMuseumListFailed(message: response.message)));
        }

        final museumList = response.result!;
        Map<PlaceCategory,List<PlaceDto>?> currentList = state.placeList;

        //group places by category "museum" in map
        for(PlaceDto place in museumList) {
          currentList[category]?.add(place);
        }

        emit(state.copyWith(museumListStatus: GetMuseumListSuccess(), placeList: currentList));

      }catch(e) {
        emit(state.copyWith(museumListStatus: GetMuseumListFailed(message: "something went wrong..", exception: e)));
      }
    });
  }
}
