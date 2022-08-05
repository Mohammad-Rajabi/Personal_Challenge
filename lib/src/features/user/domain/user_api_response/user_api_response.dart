import 'package:finnogate_challenge/src/features/user/domain/user_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_api_response.freezed.dart';
part 'user_api_response.g.dart';

@freezed
class UserApiResponse with _$UserApiResponse{

  factory UserApiResponse({
    @JsonKey(name: 'data')
    @Default(null)
    UserModel? user,

  })=_UserApiResponse;

  factory UserApiResponse.fromJson(Map<String,dynamic> json)=>_$UserApiResponseFromJson(json);
}