
import 'package:edirne_gezgini_ui/constants.dart' as constants;
import 'package:edirne_gezgini_ui/model/api_response.dart';
import 'package:edirne_gezgini_ui/model/dto/authentication_request_dto.dart';
import 'package:edirne_gezgini_ui/model/dto/registration_request_dto.dart';
import 'package:edirne_gezgini_ui/util/http_request/client_entity.dart';
import 'package:edirne_gezgini_ui/util/http_request/rest_client.dart';


class AuthRepository {
  final String authApiUrl = constants.authApiUrl;

  Future<APIResponse> register(RegistrationRequestDto requestDto) async{
    final String url = "$authApiUrl/register";
    Map<String, dynamic> body = requestDto.toMap();

    final ClientEntity clientEntity = ClientEntity.httpPost(url, body);
    return await RestClient().send(clientEntity);
  }

  Future<APIResponse> login(AuthenticationRequestDto requestDto) async{
    final String url = "$authApiUrl/login";
    Map<String, dynamic> body = requestDto.toMap();

    final ClientEntity clientEntity = ClientEntity.httpPost(url, body);
    return await RestClient().send(clientEntity);
  }
}