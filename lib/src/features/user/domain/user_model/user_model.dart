import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{

  factory UserModel({
    int? id,
    String? email,
    String? avatar,
    @JsonKey(name: 'first_name')
    String? firstName,
    @JsonKey(name: 'last_name')
    String? lastName,

  })=_UserModel;

  factory UserModel.fromJson(Map<String,dynamic> json)=>_$UserModelFromJson(json);
}