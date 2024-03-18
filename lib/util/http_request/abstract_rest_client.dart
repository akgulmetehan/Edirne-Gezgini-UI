import '../../model/api_response.dart';
import 'client_entity.dart';

abstract class AbstractRestClient {
  Future<APIResponse> send(ClientEntity clientEntity);
}