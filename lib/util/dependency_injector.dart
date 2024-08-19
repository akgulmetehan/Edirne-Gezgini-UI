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
    _getIt.registerSingleton(AuthCredentialStore);
    _registerUtils();
    _registerServices();
    _registerRepositories();
  }

  static void _registerServices() {

  }

  static void _registerRepositories() {
  }

  static void _registerUtils() {
  }
}