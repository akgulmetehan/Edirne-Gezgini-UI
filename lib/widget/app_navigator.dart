import 'package:edirne_gezgini_ui/bloc/auth_bloc/auth_navigator.dart';
import 'package:edirne_gezgini_ui/bloc/auth_bloc/session_cubit.dart';
import 'package:edirne_gezgini_ui/bloc/auth_bloc/session_state.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_navigator_cubit.dart';
import 'package:edirne_gezgini_ui/widget/bottom_navigation_bar.dart';
import 'package:edirne_gezgini_ui/widget/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit,SessionState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              const MaterialPage(child: LoadingScreen()),

              if(state is UnAuthenticated)
                const MaterialPage(child: AuthNavigator()),

              if(state is Authenticated)
                MaterialPage(child: BottomNavBar(homeNavigatorCubit: HomeNavigatorCubit(),))
            ],

            onPopPage: (route,result) {
              return route.didPop(result);
            },
          );
        }
    );
  }
}