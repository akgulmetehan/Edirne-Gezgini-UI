import 'http_request_type.dart';

class ClientEntity {
  final Map<String, dynamic>? body;

  final String url;

  final String? token;

  final HttpRequestType requestType;

  ClientEntity._(this.url, this.requestType, {this.token, this.body});

  static ClientEntity httpGet(String url, String token) {
    return ClientEntity._(url, HttpRequestType.get, token: token);
  }

  static ClientEntity httpPut(
      String url, String token, Map<String, dynamic> body) {
    return ClientEntity._(url, HttpRequestType.put, body: body, token: token);
  }

  static ClientEntity httpPostWithToken(
      String url, String token, Map<String, dynamic> body) {
    return ClientEntity._(url, HttpRequestType.post, body: body, token: token);
  }

  static ClientEntity httpPost(String url, Map<String, dynamic> body) {
    return ClientEntity._(url, HttpRequestType.post, body: body);
  }

  static ClientEntity httpDelete(String url, String token) {
    return ClientEntity._(url, HttpRequestType.delete, token: token);
  }
}
