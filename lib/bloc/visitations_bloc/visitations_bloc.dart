import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_event.dart';
import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_state.dart';
import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_status.dart';
import 'package:edirne_gezgini_ui/model/dto/visitation_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/service/visitation_service.dart';
import 'package:edirne_gezgini_ui/util/auth_credential_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitationsBloc extends Bloc<VisitationsEvent,VisitationsState> {
  final VisitationService visitationService;
  final AuthCredentialStore authStore;

  VisitationsBloc({required this.visitationService, required this.authStore}) : super(VisitationsState()) {
    on<GetVisitationList>((event,emit) async{
      if(state.visitationsStatus.toString() == "DeleteVisitationFailed") {
        emit(state.copyWith(visitationsStatus: GetVisitationListSuccess()));
        return;
      }

      emit(state.copyWith(visitationsStatus: GetVisitationListPending()));

      try {
        final response = await visitationService.getAuthenticatedUserVisitations();

        final visitedPlaceList = response.result!;
        Map<BasePlaceCategory,List<VisitationDto>?> currentList = state.visitationList;

        //if visitation lists contains data, empty it.
        for(var category in currentList.keys ) {
          if(currentList[category]!.isNotEmpty) {
            currentList[category] = [];
          }
        }

        //group visitations by category in map
        for(VisitationDto visitationDto in visitedPlaceList) {
          final category = visitationDto.category;

          currentList[category]?.add(visitationDto);
        }

        emit(state.copyWith(visitationsStatus: GetVisitationListSuccess(), visitationList: currentList));

      } catch(e) {
        emit(state.copyWith(visitationsStatus: GetVisitationListFailed(message: "something went wrong..", exception: e)));
      }
    });

    on<DeleteVisitation>((event,emit) async{
      emit(state.copyWith(visitationsStatus: DeleteVisitationPending()));

      try {
        final response = await visitationService.deleteVisitation(event.visitationId);

        if(response.message != "success") {
          emit(state.copyWith(visitationsStatus: DeleteVisitationFailed(message: response.message)));
        }

        final currentList = state.visitationList;
        final category = event.category;
        currentList[category]?.removeWhere((visitation) => visitation.id == event.visitationId);

        emit(state.copyWith(visitationList: currentList, visitationsStatus: DeleteVisitationSuccess()));

      } catch (e) {
        emit(state.copyWith(visitationsStatus: DeleteVisitationFailed(message: "something went wrong..", exception: e)));
      }
    });

  }
}