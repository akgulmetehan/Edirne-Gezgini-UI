import 'package:edirne_gezgini_ui/bloc/home_bloc/home_navigator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigatorCubit extends Cubit<HomeNavigatorState> {
  static final HomeNavigatorCubit _singleton = HomeNavigatorCubit._internal();

  factory HomeNavigatorCubit(){
    return _singleton;
  }

  HomeNavigatorCubit._internal() : super(HomeNavigatorState.home);

  void showHome() => emit(HomeNavigatorState.home);
  void showHotels() => emit(HomeNavigatorState.hotels);
  void showRestaurants() => emit(HomeNavigatorState.restaurants);
}