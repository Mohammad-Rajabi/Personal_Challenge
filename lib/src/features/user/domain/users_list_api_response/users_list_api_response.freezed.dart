// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'users_list_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersListApiResponse _$UsersListApiResponseFromJson(Map<String, dynamic> json) {
  return _UsersListApiResponse.fromJson(json);
}

/// @nodoc
mixin _$UsersListApiResponse {
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<UserModel> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersListApiResponseCopyWith<UsersListApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersListApiResponseCopyWith<$Res> {
  factory $UsersListApiResponseCopyWith(UsersListApiResponse value,
          $Res Function(UsersListApiResponse) then) =
      _$UsersListApiResponseCopyWithImpl<$Res>;
  $Res call(
      {int? page,
      @JsonKey(name: 'per_page') int? perPage,
      int? total,
      @JsonKey(name: 'total_pages') int? totalPages,
      @JsonKey(name: 'data') List<UserModel> users});
}

/// @nodoc
class _$UsersListApiResponseCopyWithImpl<$Res>
    implements $UsersListApiResponseCopyWith<$Res> {
  _$UsersListApiResponseCopyWithImpl(this._value, this._then);

  final UsersListApiResponse _value;
  // ignore: unused_field
  final $Res Function(UsersListApiResponse) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: perPage == freezed
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_UsersListApiResponseCopyWith<$Res>
    implements $UsersListApiResponseCopyWith<$Res> {
  factory _$$_UsersListApiResponseCopyWith(_$_UsersListApiResponse value,
          $Res Function(_$_UsersListApiResponse) then) =
      __$$_UsersListApiResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? page,
      @JsonKey(name: 'per_page') int? perPage,
      int? total,
      @JsonKey(name: 'total_pages') int? totalPages,
      @JsonKey(name: 'data') List<UserModel> users});
}

/// @nodoc
class __$$_UsersListApiResponseCopyWithImpl<$Res>
    extends _$UsersListApiResponseCopyWithImpl<$Res>
    implements _$$_UsersListApiResponseCopyWith<$Res> {
  __$$_UsersListApiResponseCopyWithImpl(_$_UsersListApiResponse _value,
      $Res Function(_$_UsersListApiResponse) _then)
      : super(_value, (v) => _then(v as _$_UsersListApiResponse));

  @override
  _$_UsersListApiResponse get _value => super._value as _$_UsersListApiResponse;

  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? users = freezed,
  }) {
    return _then(_$_UsersListApiResponse(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: perPage == freezed
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      users: users == freezed
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsersListApiResponse implements _UsersListApiResponse {
  _$_UsersListApiResponse(
      {this.page,
      @JsonKey(name: 'per_page') this.perPage,
      this.total,
      @JsonKey(name: 'total_pages') this.totalPages,
      @JsonKey(name: 'data') final List<UserModel> users = const []})
      : _users = users;

  factory _$_UsersListApiResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UsersListApiResponseFromJson(json);

  @override
  final int? page;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  final int? total;
  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  final List<UserModel> _users;
  @override
  @JsonKey(name: 'data')
  List<UserModel> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'UsersListApiResponse(page: $page, perPage: $perPage, total: $total, totalPages: $totalPages, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersListApiResponse &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.perPage, perPage) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality()
                .equals(other.totalPages, totalPages) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(perPage),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(totalPages),
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  _$$_UsersListApiResponseCopyWith<_$_UsersListApiResponse> get copyWith =>
      __$$_UsersListApiResponseCopyWithImpl<_$_UsersListApiResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersListApiResponseToJson(
      this,
    );
  }
}

abstract class _UsersListApiResponse implements UsersListApiResponse {
  factory _UsersListApiResponse(
          {final int? page,
          @JsonKey(name: 'per_page') final int? perPage,
          final int? total,
          @JsonKey(name: 'total_pages') final int? totalPages,
          @JsonKey(name: 'data') final List<UserModel> users}) =
      _$_UsersListApiResponse;

  factory _UsersListApiResponse.fromJson(Map<String, dynamic> json) =
      _$_UsersListApiResponse.fromJson;

  @override
  int? get page;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  int? get total;
  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  @JsonKey(name: 'data')
  List<UserModel> get users;
  @override
  @JsonKey(ignore: true)
  _$$_UsersListApiResponseCopyWith<_$_UsersListApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
