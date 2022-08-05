// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UsersListApiResponse _$$_UsersListApiResponseFromJson(
        Map<String, dynamic> json) =>
    _$_UsersListApiResponse(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
      totalPages: json['total_pages'] as int?,
      users: (json['data'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UsersListApiResponseToJson(
        _$_UsersListApiResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.users,
    };
