import 'dart:io';

import 'package:edirne_gezgini_ui/model/dto/change_password_dto.dart';
import 'package:get_it/get_it.dart';

import '../model/api_response.dart';
import '../model/dto/update_user_dto.dart';
import '../util/auth_credential_store.dart';
import '../util/http_request/client_entity.dart';
import '../util/http_request/rest_client.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;

class UserRepository {
  final String _userApiBaseUrl = constants.userApiUrl;
  final GetIt getIt = GetIt.instance;

  Future<APIResponse> getAuthenticatedUser() async {
    final url = "$_userApiBaseUrl/getAuthenticatedUser";
    final String? token = getIt<AuthCredentialStore>().token;


    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> updateAuthenticatedUser(UpdateUserDto updateUserDto) async {
    final url = "$_userApiBaseUrl/updateAuthenticatedUser";
    final String? token = getIt<AuthCredentialStore>().token;
    final body = updateUserDto.toMap();

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpPut(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getUserById(String id) async {
    final url = "$_userApiBaseUrl/getUserById/$id";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getUserByEmail(String email) async {
    final url = "$_userApiBaseUrl/getUserByEmail/$email";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> getAllUsers() async {
    final url = "$_userApiBaseUrl/getAll";
    final String? token = getIt<AuthCredentialStore>().token;

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpGet(url, token);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> updateUser(UpdateUserDto updateUserDto) async {
    final url = "$_userApiBaseUrl/updateUser";
    final String? token = getIt<AuthCredentialStore>().token;
    final body = updateUserDto.toMap();

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpPut(url, token, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> changePassword(ChangePasswordDto changePasswordDto) async{
    final url = "$_userApiBaseUrl/changePassword";
    final String? token = getIt<AuthCredentialStore>().token;
    final body = changePasswordDto.toMap();

    if(token == null) {
      return APIResponse(httpStatus: HttpStatus.internalServerError, message: "error while retrieving token");
    }

    final ClientEntity clientEntity = ClientEntity.httpPut(url, token, body);
    return await RestClient().send(clientEntity);
  }
}