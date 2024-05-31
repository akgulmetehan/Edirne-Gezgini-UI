import 'dart:io';

import 'package:edirne_gezgini_ui/model/api_response.dart';
import 'package:edirne_gezgini_ui/util/http_request/abstract_rest_client.dart';
import 'package:edirne_gezgini_ui/util/http_request/client_entity.dart';
import 'package:edirne_gezgini_ui/util/http_request/http_request_type.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestClient extends AbstractRestClient {
  @override
  Future<APIResponse> send(ClientEntity clientEntity) async {
    try {
      return await _sendRequest(clientEntity);
    } catch (e) {
      return APIResponse(
          httpStatus: HttpStatus.internalServerError,
          message: "error while sending request 5892");
    }
  }

  Future<APIResponse> _sendRequest(ClientEntity clientEntity) async {
    String? token = clientEntity.token;
    final body = jsonEncode(clientEntity.body);
    HttpRequestType requestType = clientEntity.requestType;
    Uri uri = Uri.parse(clientEntity.url);
    Map<String, String> headers = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    late http.Response response;

    switch (requestType) {
      case HttpRequestType.put:
        response = await http.put(uri, body: body, headers: headers);

      case HttpRequestType.post:
        response = clientEntity.token == null
            //if that is a authentication request, token will not be need.
            ? await http.post(uri, body: body, headers: {'Content-Type': 'application/json'})
            : await http.post(uri, body: body, headers: headers);

      case HttpRequestType.delete:
        response = await http.delete(uri, headers: headers);

      default:
        response = await http.get(uri, headers: headers);
    }

    final jsonData = jsonDecode(response.body);

    return APIResponse.fromJson(jsonData);
  }
}
