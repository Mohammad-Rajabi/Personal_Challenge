// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserApiResponse _$UserApiResponseFromJson(Map<String, dynamic> json) {
  return _UserApiResponse.fromJson(json);
}

/// @nodoc
mixin _$UserApiResponse {
  @JsonKey(name: 'data')
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserApiResponseCopyWith<UserApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserApiResponseCopyWith<$Res> {
  factory $UserApiResponseCopyWith(
          UserApiResponse value, $Res Function(UserApiResponse) then) =
      _$UserApiResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'data') UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserApiResponseCopyWithImpl<$Res>
    implements $UserApiResponseCopyWith<$Res> {
  _$UserApiResponseCopyWithImpl(this._value, this._then);

  final UserApiResponse _value;
  // ignore: unused_field
  final $Res Function(UserApiResponse) _then;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserApiResponseCopyWith<$Res>
    implements $UserApiResponseCopyWith<$Res> {
  factory _$$_UserApiResponseCopyWith(
          _$_UserApiResponse value, $Res Function(_$_UserApiResponse) then) =
      __$$_UserApiResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'data') UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_UserApiResponseCopyWithImpl<$Res>
    extends _$UserApiResponseCopyWithImpl<$Res>
    implements _$$_UserApiResponseCopyWith<$Res> {
  __$$_UserApiResponseCopyWithImpl(
      _$_UserApiResponse _value, $Res Function(_$_UserApiResponse) _then)
      : super(_value, (v) => _then(v as _$_UserApiResponse));

  @override
  _$_UserApiResponse get _value => super._value as _$_UserApiResponse;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_UserApiResponse(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserApiResponse implements _UserApiResponse {
  _$_UserApiResponse({@JsonKey(name: 'data') this.user = null});

  factory _$_UserApiResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserApiResponseFromJson(json);

  @override
  @JsonKey(name: 'data')
  final UserModel? user;

  @override
  String toString() {
    return 'UserApiResponse(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserApiResponse &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_UserApiResponseCopyWith<_$_UserApiResponse> get copyWith =>
      __$$_UserApiResponseCopyWithImpl<_$_UserApiResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserApiResponseToJson(
      this,
    );
  }
}

abstract class _UserApiResponse implements UserApiResponse {
  factory _UserApiResponse({@JsonKey(name: 'data') final UserModel? user}) =
      _$_UserApiResponse;

  factory _UserApiResponse.fromJson(Map<String, dynamic> json) =
      _$_UserApiResponse.fromJson;

  @override
  @JsonKey(name: 'data')
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$_UserApiResponseCopyWith<_$_UserApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
