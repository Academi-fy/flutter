import 'package:rotteck_messenger/domain/entities/general/blackboard.dart';
import 'package:rotteck_messenger/domain/entities/general/class.dart';
import 'package:rotteck_messenger/domain/entities/general/course.dart';


class User {

  late String id;
  late String firstName;
  late String lastName;
  late String? avatar;
  late String type;
  late List<Class> classes;
  late List<Course> extraCourses;
  late List<Blackboard> blackboards;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.avatar,
    required this.type,
    required this.classes,
    required this.extraCourses,
    required this.blackboards
  });

}
