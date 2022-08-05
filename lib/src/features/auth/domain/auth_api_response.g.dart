// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthApiResponse _$$_AuthApiResponseFromJson(Map<String, dynamic> json) =>
    _$_AuthApiResponse(
      id: json['id'] as int?,
      token: json['token'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_AuthApiResponseToJson(_$_AuthApiResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'error': instance.error,
    };
