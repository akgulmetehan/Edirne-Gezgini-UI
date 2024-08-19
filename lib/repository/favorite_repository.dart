import 'dart:io';

import 'package:edirne_gezgini_ui/model/api_response.dart';
import 'package:get_it/get_it.dart';
import '../model/dto/create_favorite_dto.dart';
import '../util/auth_credential_store.dart';
import '../util/http_request/client_entity.dart';
import '../util/http_request/rest_client.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;

class FavoriteRepository {
  final String baseUrl = constants.favoriteApiUrl;
  final GetIt getIt = GetIt.instance;

  Future<APIResponse> getFavorite(String id) async {
    final url = "$baseUrl/getFavorite/$id";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAll() async {
    final url = "$baseUrl/getAll";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> createFavorite(CreateFavoriteDto createFavoriteDto) async {
    final url = "$baseUrl/createFavorite";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final clientEntity = ClientEntity.httpPostWithToken(url, token, createFavoriteDto.toMap());
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> deleteFavorite(String id) async {
    final url = "$baseUrl/deleteFavorite/$id";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final clientEntity = ClientEntity.httpDelete(url, token);
    return await RestClient().send(clientEntity);
  }
}