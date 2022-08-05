import 'package:finnogate_challenge/src/features/auth/domain/auth_api_response.dart';

abstract class AuthDataSource {
  Future<AuthApiResponse> login({required String email,required String password});
  Future<AuthApiResponse> register({required String email,required String password});
}