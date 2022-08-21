import 'package:finnogate_challenge/src/constants/http_constant.dart';
import 'package:finnogate_challenge/src/features/auth/domain/auth_api_response.dart';
import 'package:finnogate_challenge/src/features/user/data/user_data_source.dart';
import 'package:finnogate_challenge/src/features/user/domain/users_list_api_response/users_list_api_response.dart';
import 'package:finnogate_challenge/src/utils/http_client_service.dart';

class RemoteUserDataSource implements UserDataSource {
  HttpClientService _httpClientService;

  RemoteUserDataSource({required HttpClientService httpClientService})
      : _httpClientService = httpClientService;

  @override
  Future<AuthApiResponse> getUser(int userId) {
    throw UnimplementedError();
  }

  @override
  Future<UsersListApiResponse> getUsers(int page) async {
    final dio =  _httpClientService.getDio(kAuthAndUserBaseUrl);
    Map<String, dynamic> queryParameters = {"delay":2,"page":page};
    final response = await dio.get(kUsersEndPoint,queryParameters: queryParameters);
    return UsersListApiResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
