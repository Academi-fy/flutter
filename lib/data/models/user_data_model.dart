import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  late String id;
  late String firstName;
  late String lastName;
  late String? avatar;
  late String type;
  late List<dynamic>? classes;
  late List<dynamic>? extraCourses;
  late List<dynamic>? blackboards;

  UserDataModel(
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.type,
    this.classes,
    this.extraCourses,
    this.blackboards,
  );

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
