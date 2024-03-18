import 'dart:io';

import 'package:edirne_gezgini_ui/model/api_response.dart';
import 'package:edirne_gezgini_ui/util/http_request/abstract_rest_client.dart';
import 'package:edirne_gezgini_ui/util/http_request/client_entity.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'http_request_type.dart';

class RestClient extends AbstractRestClient {
  @override
  Future<APIResponse> send(ClientEntity clientEntity) async {
    try {
      return await _sendRequest(clientEntity);
    } catch (e) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while sending request");
    }
  }

  Future<APIResponse> _sendRequest(ClientEntity clientEntity) async {
    String? token = clientEntity.token;
    HttpRequestType requestType = clientEntity.requestType;
    Uri uri = Uri.parse(clientEntity.url);
    Map<String, String> headers = {'Authorization': "Bearer $token"};
    late http.Response response;

    switch (requestType) {
      case post:
        response = clientEntity.token == null
            //if that is a authentication request, token will not be need.
            ? await http.post(uri, body: clientEntity.body)
            : await http.post(uri, body: clientEntity.body, headers: headers);

      case put:
        response =
            await http.put(uri, body: clientEntity.body, headers: headers);

      case delete:
        response = await http.delete(uri, headers: headers);

      default:
        response = await http.get(uri, headers: headers);
    }

    final jsonData = jsonDecode(response.body);

    return APIResponse.fromJson(jsonData);
  }
}
