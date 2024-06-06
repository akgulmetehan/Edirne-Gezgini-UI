import 'package:edirne_gezgini_ui/bloc/hotels_bloc/hotels_status.dart';
import 'package:edirne_gezgini_ui/model/dto/accommodation_dto.dart';


class HotelsState {
  final HotelListStatus hotelListStatus;
  final List<AccommodationDto> hotelList;

  HotelsState(
      {this.hotelListStatus = const InitialHotelListStatus(),
      this.hotelList = const []});

  HotelsState copyWith(
      {HotelListStatus? hotelListStatus, List<AccommodationDto>? hotelList}) {
    return HotelsState(
        hotelListStatus: hotelListStatus ?? this.hotelListStatus,
        hotelList: hotelList ?? this.hotelList);
  }
}
