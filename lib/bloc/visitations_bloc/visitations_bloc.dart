import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_event.dart';
import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_state.dart';
import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_status.dart';
import 'package:edirne_gezgini_ui/model/dto/accommodation_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/place_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/restaurant_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/visitation_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/service/accommodation_service.dart';
import 'package:edirne_gezgini_ui/service/place_service.dart';
import 'package:edirne_gezgini_ui/service/restaurant_service.dart';
import 'package:edirne_gezgini_ui/service/visitation_service.dart';
import 'package:edirne_gezgini_ui/util/auth_credential_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitationsBloc extends Bloc<VisitationsEvent, VisitationsState> {
  final VisitationService visitationService;
  final AccommodationService accommodationService;
  final PlaceService placeService;
  final RestaurantService restaurantService;
  final AuthCredentialStore authStore;

  VisitationsBloc(
      {required this.accommodationService,
      required this.placeService,
      required this.restaurantService,
      required this.visitationService,
      required this.authStore})
      : super(VisitationsState(
            visitationList: {},
            accommodationList: {},
            placeList: {},
            restaurantList: {})) {

    on<GetVisitationList>((event, emit) async {
      //if (state.visitationsStatus.toString() == "DeleteVisitationFailed") {
      //emit(state.copyWith(visitationsStatus: GetVisitationListSuccess()));
      // return;
      //}


      try {
        emit(state.copyWith(visitationsStatus: GetVisitationListPending()));
        final visitationResponse =
            await visitationService.getAuthenticatedUserVisitations();
        final restaurantResponse = await restaurantService.getAll();
        final placeResponse = await placeService.getAll();
        final accommodationResponse =
            await accommodationService.getAllAccommodations();

        final visitationList = visitationResponse.result;
        Map<BasePlaceCategory, List<VisitationDto?>> currentVisitationList = {};
        currentVisitationList[BasePlaceCategory.restaurant] = [];
        currentVisitationList[BasePlaceCategory.accommodation] = [];
        currentVisitationList[BasePlaceCategory.place] = [];
        Map<String, RestaurantDto> restaurantList = {};
        Map<String, PlaceDto> placeList = {};
        Map<String, AccommodationDto> accommodationList = {};

        //group visitations by category
        //and separate them to lists
        for (VisitationDto visitationDto in visitationList!) {
          final category = visitationDto.category;
          final visitedPlaceId = visitationDto.visitedPlaceId;

          currentVisitationList[category]!.add(visitationDto);

          switch (category) {
            case BasePlaceCategory.accommodation:
              if(accommodationResponse.message == "success") {
                final accommodationDto = accommodationResponse.result
                    ?.firstWhere((accommodation) => accommodation.id == visitedPlaceId);

                accommodationList[visitedPlaceId] = accommodationDto!;
              }
              break;

            case BasePlaceCategory.place:
              if(placeResponse.message == "success") {
                final placeDto = placeResponse.result
                    ?.firstWhere((place) => place.id == visitedPlaceId);

                placeList[visitedPlaceId] = placeDto!;
              }
              break;

            case BasePlaceCategory.restaurant:
              if(restaurantResponse.message == "success") {
                final restaurantDto = restaurantResponse.result
                    ?.firstWhere((restaurant) => restaurant.id == visitedPlaceId);

                restaurantList[visitedPlaceId] = restaurantDto!;
              }
              break;
          }
        }

        emit(state.copyWith(
            visitationsStatus: GetVisitationListSuccess(),
            visitationList: currentVisitationList,
            restaurantList: restaurantList,
            placeList: placeList,
            accommodationList: accommodationList));

      } catch (e) {
        emit(state.copyWith(
            visitationsStatus: GetVisitationListFailed(
                message: "something went wrong..", exception: e)));
      }
    });

    on<DeleteVisitation>((event, emit) async {
      emit(state.copyWith(visitationsStatus: DeleteVisitationPending()));
      final visitationToBeDeleted = event.visitation;
      final visitationId = visitationToBeDeleted.id;

      try {
        final response =
            await visitationService.deleteVisitation(visitationId);

        if (response.message != "success") {
          emit(state.copyWith(
              visitationsStatus:
                  DeleteVisitationFailed(message: response.message)));
        }

        final visitationList = state.visitationList;
        final category = event.visitation.category;
        //delete visitation
        visitationList[category]
            ?.removeWhere((visitation) => visitation?.id == visitationId);

        //remove visited place from state
        final visitedPlaceId = visitationToBeDeleted.visitedPlaceId;
        switch(category) {
          case BasePlaceCategory.accommodation:
            final accommodationList = state.accommodationList;
            accommodationList.remove(visitedPlaceId);

            emit(state.copyWith(accommodationList: accommodationList));
          case BasePlaceCategory.place:
            final placeList = state.placeList;
            placeList.remove(visitedPlaceId);

            emit(state.copyWith(placeList: placeList));
          case BasePlaceCategory.restaurant:
            final restaurantList = state.restaurantList;
            restaurantList.remove(visitedPlaceId);

            emit(state.copyWith(restaurantList: restaurantList));
        }


        emit(state.copyWith(
            visitationList: visitationList,
            visitationsStatus: DeleteVisitationSuccess()));
      } catch (e) {
        emit(state.copyWith(
            visitationsStatus: DeleteVisitationFailed(
                message: "something went wrong..", exception: e)));
      }
    });
  }
}
