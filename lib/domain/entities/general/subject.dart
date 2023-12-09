import 'package:rotteck_messenger/domain/entities/general/course.dart';

class Subject {

  late String type;
  late String shortName;
  late List<Course> courses;

  Subject({
    required this.type,
    required this.shortName,
    required this.courses
  });

}