// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserFromJson(Map<String, dynamic> json) => UserDataModel(
      json['id'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['avatar'] as String?,
      json['type'] as String,
      json['classes'] as List<dynamic>,
      json['extraCourses'] as List<dynamic>,
      json['blackboards'] as List<dynamic>,
    );

Map<String, dynamic> _$UserToJson(UserDataModel instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
      'type': instance.type,
      'classes': instance.classes,
      'extraCourses': instance.extraCourses,
      'blackboards': instance.blackboards,
    };
