import 'package:edirne_gezgini_ui/bloc/restaurants_bloc/restaurants_event.dart';
import 'package:edirne_gezgini_ui/bloc/restaurants_bloc/restaurants_state.dart';
import 'package:edirne_gezgini_ui/bloc/restaurants_bloc/restaurants_status.dart';
import 'package:edirne_gezgini_ui/service/restaurant_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final RestaurantService restaurantService;

  RestaurantsBloc({required this.restaurantService}) : super(RestaurantsState()) {
    on<GetRestaurantList>((event,emit) async {
      emit(state.copyWith(restaurantListStatus: GetRestaurantListPending()));

      try {
        final response = await restaurantService.getAll();

        if(response.message != "success") {
          emit(state.copyWith(restaurantListStatus: GetRestaurantListFailed(message: response.message)));
        }

        final restaurantList = response.result!;
        emit(state.copyWith(restaurantListStatus: GetRestaurantListSuccess(), restaurantList: restaurantList));

      } catch(e) {
        emit(state.copyWith(restaurantListStatus: GetRestaurantListFailed(message: "something went wrong..", exception: e)));
      }
    });
  }
}