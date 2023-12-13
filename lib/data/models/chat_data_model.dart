import 'package:json_annotation/json_annotation.dart';

part 'chat_data_model.g.dart';

@JsonSerializable()
class ChatDataModel {
  late String id;
  late String? type;
  late List<dynamic>? targets;
  late List<dynamic>? courses;
  late List<dynamic>? clubs;
  late String? name;
  late String? avatar;
  late List<dynamic>? messages;

  ChatDataModel({
    required this.id,
    this.type,
    this.targets,
    this.courses,
    this.clubs,
    this.name,
    this.avatar,
    this.messages,
  });

  factory ChatDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChatDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatDataModelToJson(this);
}
