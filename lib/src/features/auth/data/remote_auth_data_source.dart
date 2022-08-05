import 'package:dio/dio.dart';
import 'package:finnogate_challenge/src/constants/http_constant.dart';
import 'package:finnogate_challenge/src/features/auth/data/auth_data_source.dart';
import 'package:finnogate_challenge/src/features/auth/domain/auth_api_response.dart';
import 'package:finnogate_challenge/src/utils/http_client_service.dart';
import 'package:finnogate_challenge/src/utils/token_container.dart';

class RemoteAuthDataSource implements AuthDataSource {
  HttpClientService _httpClientService;

  RemoteAuthDataSource({required HttpClientService httpClientService})
      : _httpClientService = httpClientService;

  @override
  Future<AuthApiResponse> login(
      {required String email, required String password}) async {
    final dio = _httpClientService.getDio(kAuthAndUserBaseUrl);
    Map<String, dynamic> jsonMap = {"email": email, "password": password};
    final response = await dio.post(kLoginEndPoint,
        data: jsonMap,
        options: Options(headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        }));
    AuthApiResponse authApiResponse = AuthApiResponse();
    if (response.statusCode == 200) {
      authApiResponse = AuthApiResponse.fromJson(response.data);
      TokenContainer().token = authApiResponse.token!;
    }

    return authApiResponse;
  }

  @override
  Future<AuthApiResponse> register(
      {required String email, required String password}) async {
    final dio = _httpClientService.getDio(kAuthAndUserBaseUrl);

    Map<String, dynamic> jsonMap = {"email": email, "password": password};

    final response = await dio.post(kRegisterEndPoint,
        data: jsonMap,
        options: Options(headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        }));
    AuthApiResponse authApiResponse = AuthApiResponse();
    if (response.statusCode == 200) {
      authApiResponse = AuthApiResponse.fromJson(response.data);
      TokenContainer().token = authApiResponse.token!;
    }

    return authApiResponse;
  }
}
