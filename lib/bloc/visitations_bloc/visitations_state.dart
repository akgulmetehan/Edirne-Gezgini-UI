import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_status.dart';
import 'package:edirne_gezgini_ui/model/dto/visitation_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';

import '../../model/dto/accommodation_dto.dart';
import '../../model/dto/place_dto.dart';
import '../../model/dto/restaurant_dto.dart';

class VisitationsState {
  final VisitationsStatus visitationsStatus;
  Map<BasePlaceCategory, List<VisitationDto?>> visitationList;
  Map<String, AccommodationDto> accommodationList;
  Map<String, PlaceDto> placeList;
  Map<String, RestaurantDto> restaurantList;

  VisitationsState({
    this.visitationsStatus = const InitialVisitationStatus(),
    required this.visitationList,
    required this.accommodationList,
    required this.placeList,
    required this.restaurantList,
  });

  VisitationsState copyWith({
    VisitationsStatus? visitationsStatus,
    Map<BasePlaceCategory, List<VisitationDto?>>? visitationList,
    Map<String, AccommodationDto>? accommodationList,
    Map<String, PlaceDto>? placeList,
    Map<String, RestaurantDto>? restaurantList
  }) {
    return VisitationsState(
        visitationList: visitationList ?? this.visitationList,
        visitationsStatus: visitationsStatus ?? this.visitationsStatus,
        accommodationList: accommodationList ?? this.accommodationList,
        placeList: placeList ?? this.placeList,
        restaurantList: restaurantList ?? this.restaurantList
    );
  }
}
