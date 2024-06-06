import 'package:edirne_gezgini_ui/bloc/home_bloc/current_user_status.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/historical_list_status.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/museum_list_status.dart';
import 'package:edirne_gezgini_ui/model/dto/place_dto.dart';

import '../../model/dto/user_dto.dart';

class HomeState {
  final UserDto? currentUser;
  final MuseumListStatus museumListStatus;
  final HistoricalListStatus historicalListStatus;
  final CurrentUserStatus currentUserStatus;
  final List<PlaceDto> historicalList;
  final List<PlaceDto> museumList;

  HomeState(
      {this.currentUser,
      this.museumListStatus = const InitialMuseumListStatus(),
      this.historicalListStatus = const InitialHistoricalListStatus(),
      this.currentUserStatus = const InitialCurrentUserStatus(),
      this.historicalList = const [],
      this.museumList = const []});

  HomeState copyWith(
      {UserDto? currentUser,
      MuseumListStatus? museumListStatus,
      HistoricalListStatus? historicalListStatus,
      CurrentUserStatus? currentUserStatus,
      List<PlaceDto>? historicalList,
      List<PlaceDto>? museumList}) {
    return HomeState(
        currentUser: currentUser ?? this.currentUser,
        museumListStatus: museumListStatus ?? this.museumListStatus,
        historicalListStatus: historicalListStatus ?? this.historicalListStatus,
        currentUserStatus: currentUserStatus ?? this.currentUserStatus,
        historicalList: historicalList ?? this.historicalList,
        museumList: museumList ?? this.museumList);
  }
}
