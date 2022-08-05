// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthApiResponse _$AuthApiResponseFromJson(Map<String, dynamic> json) {
  return _AuthApiResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthApiResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthApiResponseCopyWith<AuthApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthApiResponseCopyWith<$Res> {
  factory $AuthApiResponseCopyWith(
          AuthApiResponse value, $Res Function(AuthApiResponse) then) =
      _$AuthApiResponseCopyWithImpl<$Res>;
  $Res call({int? id, String? token, String? error});
}

/// @nodoc
class _$AuthApiResponseCopyWithImpl<$Res>
    implements $AuthApiResponseCopyWith<$Res> {
  _$AuthApiResponseCopyWithImpl(this._value, this._then);

  final AuthApiResponse _value;
  // ignore: unused_field
  final $Res Function(AuthApiResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? token = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthApiResponseCopyWith<$Res>
    implements $AuthApiResponseCopyWith<$Res> {
  factory _$$_AuthApiResponseCopyWith(
          _$_AuthApiResponse value, $Res Function(_$_AuthApiResponse) then) =
      __$$_AuthApiResponseCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? token, String? error});
}

/// @nodoc
class __$$_AuthApiResponseCopyWithImpl<$Res>
    extends _$AuthApiResponseCopyWithImpl<$Res>
    implements _$$_AuthApiResponseCopyWith<$Res> {
  __$$_AuthApiResponseCopyWithImpl(
      _$_AuthApiResponse _value, $Res Function(_$_AuthApiResponse) _then)
      : super(_value, (v) => _then(v as _$_AuthApiResponse));

  @override
  _$_AuthApiResponse get _value => super._value as _$_AuthApiResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? token = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_AuthApiResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthApiResponse implements _AuthApiResponse {
  _$_AuthApiResponse({this.id, this.token, this.error});

  factory _$_AuthApiResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AuthApiResponseFromJson(json);

  @override
  final int? id;
  @override
  final String? token;
  @override
  final String? error;

  @override
  String toString() {
    return 'AuthApiResponse(id: $id, token: $token, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthApiResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_AuthApiResponseCopyWith<_$_AuthApiResponse> get copyWith =>
      __$$_AuthApiResponseCopyWithImpl<_$_AuthApiResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthApiResponseToJson(
      this,
    );
  }
}

abstract class _AuthApiResponse implements AuthApiResponse {
  factory _AuthApiResponse(
      {final int? id,
      final String? token,
      final String? error}) = _$_AuthApiResponse;

  factory _AuthApiResponse.fromJson(Map<String, dynamic> json) =
      _$_AuthApiResponse.fromJson;

  @override
  int? get id;
  @override
  String? get token;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_AuthApiResponseCopyWith<_$_AuthApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
