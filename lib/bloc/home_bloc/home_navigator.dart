import 'package:edirne_gezgini_ui/bloc/home_bloc/home_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_navigator_cubit.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_navigator_state.dart';
import 'package:edirne_gezgini_ui/service/place_service.dart';
import 'package:edirne_gezgini_ui/service/user_service.dart';
import 'package:edirne_gezgini_ui/view/home_page.dart';
import 'package:edirne_gezgini_ui/view/hotels_page.dart';
import 'package:edirne_gezgini_ui/view/restaurants_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeNavigatorCubit>(
      create: (context) => HomeNavigatorCubit(),
      child: BlocBuilder<HomeNavigatorCubit, HomeNavigatorState> (
        builder: (context, state) {
          return Navigator(
            //ToDo update HomeNavigatorState back when popped the page
            pages: [
              MaterialPage(child: _homeScreen(context)),

              if(state == HomeNavigatorState.hotels)
                const MaterialPage(child: HotelsPage()),

              if(state == HomeNavigatorState.restaurants)
                const MaterialPage(child: RestaurantsPage()),
            ],

            onPopPage: (route, result) {
              context.read<HomeNavigatorCubit>().showHome();
              return route.didPop(result);
            },
          );
        },
      ),
    );
  }

  Widget _homeScreen(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(placeService: context.read<PlaceService>(), userService: context.read<UserService>()),
        child: BlocBuilder<HomeBloc,HomeState>(
          builder: (context,state) => const HomePage(),
        ),
    );
  }
}