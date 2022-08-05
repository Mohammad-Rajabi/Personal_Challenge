import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_api_response.freezed.dart';
part 'auth_api_response.g.dart';

@freezed
class AuthApiResponse with _$AuthApiResponse{

  factory AuthApiResponse({
    int? id,
    String? token,
    String? error,
  })=_AuthApiResponse;

  factory AuthApiResponse.fromJson(Map<String,dynamic> json)=>_$AuthApiResponseFromJson(json);
}