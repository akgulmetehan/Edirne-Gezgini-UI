import 'dart:io';

import 'package:edirne_gezgini_ui/model/api_response.dart';
import '../model/dto/create_favorite_dto.dart';
import '../util/http_request/client_entity.dart';
import '../util/http_request/rest_client.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;

class FavoriteRepository {
  final String baseUrl = constants.favoriteApiUrl;
  final String token = "eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYifQ.eyJzdWIiOiI2ZGIwYzhhMi1iYjM5LTQzMjgtYmUxMC02ZTZmZTgyM2FkMzQiLCJpYXQiOjE3MTY5MDk0NjQsImV4cCI6MTcxNzE5NzQ2NH0.-GyFtV_nEpf8bQzSQgzWl4MQ_--3UYCKbo1OwlBE4wA";

  Future<APIResponse> getFavorite(String id) async {
    final url = "$baseUrl/getFavorite/$id";

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAll() async {
    final url = "$baseUrl/getAll";

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> createFavorite(CreateFavoriteDto createFavoriteDto) async {
    final url = "$baseUrl/createFavorite";

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final clientEntity = ClientEntity.httpPostWithToken(url, token, createFavoriteDto.toMap());
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> deleteFavorite(String id) async {
    final url = "$baseUrl/deleteFavorite/$id";

    if(token == null){
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final clientEntity = ClientEntity.httpDelete(url, token);
    return await RestClient().send(clientEntity);
  }
}