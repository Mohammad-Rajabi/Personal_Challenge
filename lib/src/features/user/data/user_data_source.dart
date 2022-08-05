import 'package:finnogate_challenge/src/features/auth/domain/auth_api_response.dart';
import 'package:finnogate_challenge/src/features/user/domain/users_list_api_response/users_list_api_response.dart';

abstract class UserDataSource {
  Future<UsersListApiResponse> getUsers(int page);
  Future<AuthApiResponse> getUser(int userId);
}