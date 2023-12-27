import 'package:json_annotation/json_annotation.dart';

part 'user_account_data_model.g.dart';

@JsonSerializable()
class UserAccountDataModel {
  late String id;
  late dynamic user;
  late String username;
  late String password;
  late List<dynamic>? settings;
  late List<dynamic> permissions;

  UserAccountDataModel(
      {required this.id,
      required this.user,
      required this.username,
      required this.password,
      this.settings,
      required this.permissions});

  factory UserAccountDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccountDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserAccountDataModelToJson(this);
}
