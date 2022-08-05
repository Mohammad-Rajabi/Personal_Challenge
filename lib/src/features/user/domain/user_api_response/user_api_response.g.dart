// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserApiResponse _$$_UserApiResponseFromJson(Map<String, dynamic> json) =>
    _$_UserApiResponse(
      user: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserApiResponseToJson(_$_UserApiResponse instance) =>
    <String, dynamic>{
      'data': instance.user,
    };
