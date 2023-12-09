import 'package:rotteck_messenger/domain/entities/general/course.dart';
import 'package:rotteck_messenger/domain/entities/general/grade.dart';
import 'package:rotteck_messenger/domain/entities/users/user.dart';

class Class {

  late Grade grade;
  late List<Course> courses;
  late List<User> members;
  late String specifiedGrade;

  Class({
    required this.grade,
    required this.courses,
    required this.members,
    required this.specifiedGrade
  });

}