import 'dart:io';

import 'package:edirne_gezgini_ui/model/dto/change_password_dto.dart';

import '../model/api_response.dart';
import '../model/dto/update_user_dto.dart';
import '../util/http_request/client_entity.dart';
import '../util/http_request/rest_client.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;

class UserRepository {
  final String _userApiBaseUrl = constants.userApiUrl;
  final String token = "eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYifQ.eyJzdWIiOiI2ZGIwYzhhMi1iYjM5LTQzMjgtYmUxMC02ZTZmZTgyM2FkMzQiLCJpYXQiOjE3MTcyMzc0OTEsImV4cCI6MTcxNzUyNTQ5MX0.Rvli1ImryWE7qEl3x4IE1InyaH9DcszX8KgQiNTTfS8";

  Future<APIResponse> getAuthenticatedUser() async {
    final url = "$_userApiBaseUrl/getAuthenticatedUser";

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> updateAuthenticatedUser(UpdateUserDto updateUserDto) async {
    final url = "$_userApiBaseUrl/updateAuthenticatedUser";
    final body = updateUserDto.toMap();

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpPut(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getUserById(String id) async {
    final url = "$_userApiBaseUrl/getUserById/$id";
    //final token = _getIt<JwtToken>().getToken();

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getUserByEmail(String email) async {
    final url = "$_userApiBaseUrl/getUserByEmail/$email";

   // if(token == null) {
     // return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    //}

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAllUsers() async {
    final url = "$_userApiBaseUrl/getAll";

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> updateUser(UpdateUserDto updateUserDto) async {
    final url = "$_userApiBaseUrl/updateUser";
    final body = updateUserDto.toMap();

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpPut(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> changePassword(ChangePasswordDto changePasswordDto) async{
    final url = "$_userApiBaseUrl/changePassword";
    final body = changePasswordDto.toMap();

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpPut(url, token, body);
    return await RestClient().send(clientEntity);
  }
}