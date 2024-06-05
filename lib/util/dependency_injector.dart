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
import 'package:edirne_gezgini_ui/util/http_request/client_entity.dart';
import 'package:get_it/get_it.dart';

class DependencyInjector {
  static final GetIt _getIt = GetIt.instance;

  static void setupDependencies() {
    _registerUtils();
    _registerServices();
    _registerRepositories();
  }

  static void _registerServices() {
    _getIt.registerSingleton(AccommodationService(accommodationRepository: AccommodationRepository()));
    _getIt.registerSingleton(AuthService(authRepository: AuthRepository()));
    _getIt.registerSingleton(FavoriteService(favoriteRepository: FavoriteRepository()));
    _getIt.registerSingleton(PlaceService(placeRepository: PlaceRepository()));
    _getIt.registerSingleton(RestaurantService(restaurantRepository: RestaurantRepository()));
    _getIt.registerSingleton(UserService(userRepository: UserRepository()));
    _getIt.registerSingleton(VisitationService(visitationRepository: VisitationRepository()));
  }

  static void _registerRepositories() {
    _getIt.registerSingleton(AccommodationRepository);
    _getIt.registerSingleton(AuthRepository);
    _getIt.registerSingleton(FavoriteRepository);
    _getIt.registerSingleton(PlaceRepository);
    _getIt.registerSingleton(RestaurantRepository);
    _getIt.registerSingleton(UserRepository);
    _getIt.registerSingleton(VisitationRepository);
  }

  static void _registerUtils() {
    _getIt.registerSingleton(ClientEntity);
    _getIt.registerSingleton(AuthCredentialStore);
  }
}