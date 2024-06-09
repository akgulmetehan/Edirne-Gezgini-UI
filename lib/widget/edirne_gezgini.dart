import 'package:edirne_gezgini_ui/bloc/auth_bloc/auth_cubit.dart';
import 'package:edirne_gezgini_ui/bloc/auth_bloc/session_cubit.dart';
import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_navigator_cubit.dart';
import 'package:edirne_gezgini_ui/bloc/hotels_bloc/hotels_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/login_bloc/login_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/register_bloc/register_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/restaurants_bloc/restaurants_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_bloc.dart';
import 'package:edirne_gezgini_ui/repository/accommodation_repository.dart';
import 'package:edirne_gezgini_ui/repository/auth_repository.dart';
import 'package:edirne_gezgini_ui/repository/favorite_repository.dart';
import 'package:edirne_gezgini_ui/repository/place_repository.dart';
import 'package:edirne_gezgini_ui/repository/restaurant_repository.dart';
import 'package:edirne_gezgini_ui/repository/user_repository.dart';
import 'package:edirne_gezgini_ui/repository/visitation_repository.dart';
import 'package:edirne_gezgini_ui/service/accommodation_service.dart';
import 'package:edirne_gezgini_ui/service/auth_service.dart';
import 'package:edirne_gezgini_ui/service/favorite_service.dart';
import 'package:edirne_gezgini_ui/service/place_service.dart';
import 'package:edirne_gezgini_ui/service/restaurant_service.dart';
import 'package:edirne_gezgini_ui/service/user_service.dart';
import 'package:edirne_gezgini_ui/service/visitation_service.dart';
import 'package:edirne_gezgini_ui/util/auth_credential_store.dart';
import 'package:edirne_gezgini_ui/widget/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class EdirneGezgini extends StatelessWidget {
  const EdirneGezgini({super.key});

  @override
  Widget build(BuildContext context) {
    final GetIt getIt = GetIt.instance;
    final authStore = getIt<AuthCredentialStore>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => AccommodationService(accommodationRepository: AccommodationRepository())),
            RepositoryProvider(create: (context) => AuthService(authRepository: AuthRepository())),
            RepositoryProvider(create: (context) => FavoriteService(favoriteRepository: FavoriteRepository())),
            RepositoryProvider(create: (context) => PlaceService(placeRepository: PlaceRepository())),
            RepositoryProvider(create: (context) => RestaurantService(restaurantRepository: RestaurantRepository())),
            RepositoryProvider(create: (context) => UserService(userRepository: UserRepository())),
            RepositoryProvider(create: (context) => VisitationService(visitationRepository: VisitationRepository())),
          ],

          child: MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => SessionCubit()),
                BlocProvider(
                    create: (context) => HomeNavigatorCubit()),
                BlocProvider(
                    create: (context) => AuthCubit(sessionCubit: context.read<SessionCubit>())),
                BlocProvider(
                    create: (context) => LoginBloc(authService: context.read<AuthService>(), authStore: authStore, userService: context.read<UserService>(), authCubit: context.read<AuthCubit>())),
                BlocProvider(
                    create: (context) => RegisterBloc(authService: context.read<AuthService>())),
                BlocProvider(
                    create: (context) => HomeBloc(placeService: context.read<PlaceService>(), userService: context.read<UserService>())),
                BlocProvider(
                    create: (context) => RestaurantsBloc(restaurantService: context.read<RestaurantService>())),
                BlocProvider(
                    create: (context) => VisitationsBloc(visitationService: context.read<VisitationService>(), authStore: authStore)),
                BlocProvider(
                    create: (context) => HotelsBloc(accommodationService: context.read<AccommodationService>())),
                BlocProvider(
                    create: (context) => FavoritesBloc(favoriteService: context.read<FavoriteService>())),
              ],
              child: const AppNavigator()
          )
      ),
    );
  }

}