abstract class HotelListStatus {
  const HotelListStatus();
}

class InitialHotelListStatus extends HotelListStatus {
  const InitialHotelListStatus();
}

class GetHotelListPending extends HotelListStatus{}

class GetHotelListSuccess extends HotelListStatus{}

class GetHotelListFailed extends HotelListStatus {
  final String message;
  final Object? exception;

  GetHotelListFailed({required this.message, this.exception});
}
