import 'package:finnogate_challenge/src/features/user/domain/user_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_list_api_response.freezed.dart';
part 'users_list_api_response.g.dart';

@freezed
class UsersListApiResponse with _$UsersListApiResponse{

  factory UsersListApiResponse({
    int? page,
    @JsonKey(name: 'per_page')
    int? perPage,
    int? total,
    @JsonKey(name: 'total_pages')
    int? totalPages,
    @JsonKey(name: 'data')
    @Default([]) List<UserModel> users,

  })=_UsersListApiResponse;

  factory UsersListApiResponse.fromJson(Map<String,dynamic> json)=>_$UsersListApiResponseFromJson(json);
}