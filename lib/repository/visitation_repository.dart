import 'dart:io';

import 'package:edirne_gezgini_ui/constants.dart' as constants;
import 'package:edirne_gezgini_ui/util/auth_credential_store.dart';
import 'package:get_it/get_it.dart';

import '../model/api_response.dart';
import '../model/dto/create_visitation_dto.dart';
import '../model/enum/base_place_category.dart';
import '../util/http_request/client_entity.dart';
import '../util/http_request/rest_client.dart';

class VisitationRepository {
  final String visitationApiUrl = constants.visitationApiUrl;
  final GetIt getIt = GetIt.instance;

  Future<APIResponse> getVisitation(String id) async {
    final url = "$visitationApiUrl/getVisitation/$id";
    final token = getIt<AuthCredentialStore>().token;

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAllByCategory(BasePlaceCategory category) async {
    final String categoryToString =
        BasePlaceCategoryExtension.categoryToJson(category);
    final url = "$visitationApiUrl/getAllByCategory?category=$categoryToString";
    final token = getIt<AuthCredentialStore>().token;

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> createVisitation(
      CreateVisitationDto createVisitationDto) async {
    final url = "$visitationApiUrl/createVisitation";
    final body = createVisitationDto.toMap();
    final token = getIt<AuthCredentialStore>().token;

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity =
        ClientEntity.httpPostWithToken(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> deleteVisitation(String id) async {
    final url = "$visitationApiUrl/deleteVisitation/$id";
    final token = getIt<AuthCredentialStore>().token;

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpDelete(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAll() async {
    final url = "$visitationApiUrl/getAll";
    final token = getIt<AuthCredentialStore>().token;

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAuthenticatedUserVisitations() async{
    final url = "$visitationApiUrl/getAuthenticatedUserVisitations";
    final token = getIt<AuthCredentialStore>().token;
    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }
}
