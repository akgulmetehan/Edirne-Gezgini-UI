import 'package:edirne_gezgini_ui/bloc/hotels_bloc/hotels_event.dart';
import 'package:edirne_gezgini_ui/bloc/hotels_bloc/hotels_state.dart';
import 'package:edirne_gezgini_ui/bloc/hotels_bloc/hotels_status.dart';
import 'package:edirne_gezgini_ui/model/enum/accommodation_category.dart';
import 'package:edirne_gezgini_ui/service/accommodation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/dto/accommodation_dto.dart';

class HotelsBloc extends Bloc<HotelsEvent,HotelsState> {
  final AccommodationService accommodationService;

  HotelsBloc({required this.accommodationService}) : super(HotelsState()) {
    on<GetHotelList>((event,emit) async {
      emit(state.copyWith(hotelListStatus: GetHotelListPending()));
      AccommodationCategory category = AccommodationCategory.hotel;

      try {
        final response = await accommodationService.getAllAccommodationsByCategory(category);

        if(response.message != "success") {
          emit(state.copyWith(hotelListStatus: GetHotelListFailed(message: response.message)));
        }

        List<AccommodationDto> hotelList = response.result!;

        emit(state.copyWith(hotelListStatus: GetHotelListSuccess(), hotelList: hotelList));

      }catch(e) {
        emit(state.copyWith(hotelListStatus: GetHotelListFailed(message: "something went wrong..", exception: e)));
      }
    });
  }
}