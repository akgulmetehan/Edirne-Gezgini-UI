import 'dart:io';

import 'package:edirne_gezgini_ui/constants.dart' as constants;
import 'package:edirne_gezgini_ui/model/api_response.dart';
import 'package:edirne_gezgini_ui/model/dto/create_place_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/update_place_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/place_category.dart';
import 'package:edirne_gezgini_ui/util/http_request/client_entity.dart';
import 'package:edirne_gezgini_ui/util/http_request/rest_client.dart';
import 'package:get_it/get_it.dart';

class PlaceRepository {
  final String placeApiUrl = constants.placeApiUrl;
  final GetIt getIt = GetIt.instance;
  final String token = "eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYifQ.eyJzdWIiOiI2ZGIwYzhhMi1iYjM5LTQzMjgtYmUxMC02ZTZmZTgyM2FkMzQiLCJpYXQiOjE3MTY5MDk0NjQsImV4cCI6MTcxNzE5NzQ2NH0.-GyFtV_nEpf8bQzSQgzWl4MQ_--3UYCKbo1OwlBE4wA";

  Future<APIResponse> getPlace(String id) async {
    final String url = "$placeApiUrl/getPlace/$id";

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);

    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAll() async{
    final String url = "$placeApiUrl/getAll";

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAllByCategory(PlaceCategory category) async {
    final String categoryString = PlaceCategoryExtension.categoryToJson(category);
    final String url = "$placeApiUrl/getPlaceBtCategory?category=$categoryString";

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> createPlace(CreatePlaceDto dto) async{
    final String url = "$placeApiUrl/createPlace";

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    Map<String,dynamic> body = dto.toMap();

    final ClientEntity clientEntity = ClientEntity.httpPostWithToken(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> updatePlace(UpdatePlaceDto dto) async{
    final String url = "$placeApiUrl/updatePlace";

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    Map<String,dynamic> body = dto.toMap();

    final ClientEntity clientEntity = ClientEntity.httpPut(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> deletePlace(String id) async{
    final String url = "$placeApiUrl/deletePlace/$id";

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpDelete(url, token);
    return await RestClient().send(clientEntity);
  }
}