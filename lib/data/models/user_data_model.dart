import 'package:rotteck_messenger/domain/entities/general/blackboard.dart';
import 'package:rotteck_messenger/domain/entities/general/class.dart';
import 'package:rotteck_messenger/domain/entities/general/course.dart';

class UserDataModel {
  String? id;
  String? firstName;
  String? lastName;
  String? avatar;
  String? type;
  List<Class>? classes;
  List<Course>? extraCourses;
  List<Blackboard>? blackboards;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserDataModel({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.type,
    this.classes,
    this.extraCourses,
    this.blackboards,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['_id'].toString(),
      firstName: json['first_name'].toString(),
      lastName: json['last_name'].toString(),
      avatar: json['avatar'].toString(),
      type: json['type'].toString(),
      classes: json['classes'] != null
          ? (json['classes'] as List<dynamic>)
              .map((item) => Class.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
      extraCourses: json['extra_courses'] != null
          ? (json['extra_courses'] as List<dynamic>)
              .map((item) => Course.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
      blackboards: json['blackboards'] != null
          ? (json['blackboards'] as List<dynamic>)
              .map((item) => Blackboard.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'].toString())
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'type': type,
      'classes': classes,
      'extra_courses': extraCourses,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
