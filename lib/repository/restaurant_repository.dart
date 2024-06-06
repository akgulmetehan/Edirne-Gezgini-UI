import 'dart:io';

import 'package:edirne_gezgini_ui/constants.dart' as constants;
import '../model/api_response.dart';
import '../model/dto/create_restaurant_dto.dart';
import '../model/dto/update_restaurant_dto.dart';
import '../util/http_request/client_entity.dart';
import '../util/http_request/rest_client.dart';

class RestaurantRepository {
  final String restaurantApiUrl = constants.restaurantApiUrl;
  final String token = "eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYifQ.eyJzdWIiOiI2ZGIwYzhhMi1iYjM5LTQzMjgtYmUxMC02ZTZmZTgyM2FkMzQiLCJpYXQiOjE3MTcyMzc0OTEsImV4cCI6MTcxNzUyNTQ5MX0.Rvli1ImryWE7qEl3x4IE1InyaH9DcszX8KgQiNTTfS8";

  Future<APIResponse> getRestaurant(String id) async {
    final String url = '$restaurantApiUrl/getRestaurant/$id';
    //final token = _getIt<JwtToken>().getToken();

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAll() async {
    final String url = '$restaurantApiUrl/getAll';

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getRestaurantByTitle(String title) async {
    final String url = '$restaurantApiUrl/getRestaurantByTitle/$title';

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> createRestaurant(
      CreateRestaurantDto createRestaurantDto) async {
    final String url = '$restaurantApiUrl/createRestaurant';
    final Map<String, dynamic> body = createRestaurantDto.toMap();

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity =
        ClientEntity.httpPostWithToken(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> updateRestaurant(
      UpdateRestaurantDto updateRestaurantDto) async {
    final String url = '$restaurantApiUrl/updateRestaurant';
    final Map<String, dynamic> body = updateRestaurantDto.toMap();

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpPut(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> deleteRestaurant(String id) async {
    final String url = '$restaurantApiUrl/deleteRestaurant/$id';

    if (token == null) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpDelete(url, token);
    return await RestClient().send(clientEntity);
  }
}
