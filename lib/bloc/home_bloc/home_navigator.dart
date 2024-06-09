import 'package:edirne_gezgini_ui/bloc/home_bloc/home_navigator_cubit.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_navigator_state.dart';
import 'package:edirne_gezgini_ui/view/home_page.dart';
import 'package:edirne_gezgini_ui/view/hotels_page.dart';
import 'package:edirne_gezgini_ui/view/restaurants_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeNavigatorCubit>(
      create: (context) => HomeNavigatorCubit(),
      child: BlocBuilder<HomeNavigatorCubit, HomeNavigatorState> (
        builder: (context, state) {
          return Navigator(
            pages: [
              const MaterialPage(child: HomePage()),

              if(state == HomeNavigatorState.hotels)
                const MaterialPage(child: HotelsPage()),

              if(state == HomeNavigatorState.restaurants)
                const MaterialPage(child: RestaurantsPage()),
            ],

            onPopPage: (route, result) {
              return route.didPop(result);
            },
          );
        },
      ),
    );
  }
}