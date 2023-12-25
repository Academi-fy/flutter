// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccountDataModel _$UserAccountDataModelFromJson(
        Map<String, dynamic> json) =>
    UserAccountDataModel(
      user: json['user'],
      username: json['username'] as String,
      password: json['password'] as String,
      settings: json['settings'] as List<dynamic>?,
      permissions: json['permissions'] as List<dynamic>,
    );

Map<String, dynamic> _$UserAccountDataModelToJson(
        UserAccountDataModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'username': instance.username,
      'password': instance.password,
      'settings': instance.settings,
      'permissions': instance.permissions,
    };
