import 'dart:io';

import 'package:edirne_gezgini_ui/constants.dart' as constants;
import 'package:edirne_gezgini_ui/model/api_response.dart';
import 'package:edirne_gezgini_ui/model/dto/create_place_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_place_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/place_category.dart';
import 'package:edirne_gezgini_ui/util/http_request/client_entity.dart';
import 'package:edirne_gezgini_ui/util/http_request/rest_client.dart';
import 'package:get_it/get_it.dart';

import '../util/auth_credential_store.dart';

class PlaceRepository {
  final String placeApiUrl = constants.placeApiUrl;
  final GetIt getIt = GetIt.instance;

  Future<APIResponse> getPlace(String id) async {
    final String url = "$placeApiUrl/getPlace/$id";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);

    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAll() async{
    final String url = "$placeApiUrl/getAll";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAllByCategory(PlaceCategory category) async {
    final String categoryString = PlaceCategoryExtension.categoryToJson(category);
    final String url = "$placeApiUrl/getAllByCategory?category=$categoryString";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> createPlace(CreatePlaceDto dto) async{
    final String url = "$placeApiUrl/createPlace";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    Map<String,dynamic> body = dto.toMap();

    final ClientEntity clientEntity = ClientEntity.httpPostWithToken(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> updatePlace(UpdatePlaceDto dto) async{
    final String url = "$placeApiUrl/updatePlace";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    Map<String,dynamic> body = dto.toMap();

    final ClientEntity clientEntity = ClientEntity.httpPut(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> deletePlace(String id) async{
    final String url = "$placeApiUrl/deletePlace/$id";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpDelete(url, token);
    return await RestClient().send(clientEntity);
  }
}