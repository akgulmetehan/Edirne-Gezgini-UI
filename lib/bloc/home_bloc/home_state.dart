import 'package:edirne_gezgini_ui/bloc/home_bloc/current_user_status.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/historical_list_status.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/museum_list_status.dart';
import 'package:edirne_gezgini_ui/model/dto/place_dto.dart';

import '../../model/dto/user_dto.dart';
import '../../model/enum/place_category.dart';

class HomeState {
  final UserDto? currentUser;
  final MuseumListStatus museumListStatus;
  final HistoricalListStatus historicalListStatus;
  final CurrentUserStatus currentUserStatus;
  final Map<PlaceCategory, List<PlaceDto>?> placeList;

  HomeState(
      {this.currentUser,
      this.museumListStatus = const InitialMuseumListStatus(),
      this.historicalListStatus = const InitialHistoricalListStatus(),
      this.currentUserStatus = const InitialCurrentUserStatus(),
      this.placeList = const {}});

  HomeState copyWith(
      {UserDto? currentUser,
      MuseumListStatus? museumListStatus,
      HistoricalListStatus? historicalListStatus,
      CurrentUserStatus? currentUserStatus,
      Map<PlaceCategory, List<PlaceDto>?>? placeList}) {
    return HomeState(
        currentUser: currentUser ?? this.currentUser,
        museumListStatus: museumListStatus ?? this.museumListStatus,
        historicalListStatus: historicalListStatus ?? this.historicalListStatus,
        currentUserStatus: currentUserStatus ?? this.currentUserStatus,
        placeList: placeList ?? this.placeList);
  }
}
