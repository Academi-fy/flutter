// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatDataModel _$ChatDataModelFromJson(Map<String, dynamic> json) =>
    ChatDataModel(
      id: json['id'] as String,
      type: json['type'] as String?,
      targets: json['targets'] as List<dynamic>?,
      courses: json['courses'] as List<dynamic>?,
      clubs: json['clubs'] as List<dynamic>?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      messages: json['messages'] as List<dynamic>?,
    );

Map<String, dynamic> _$ChatDataModelToJson(ChatDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'targets': instance.targets,
      'courses': instance.courses,
      'clubs': instance.clubs,
      'name': instance.name,
      'avatar': instance.avatar,
      'messages': instance.messages,
    };
