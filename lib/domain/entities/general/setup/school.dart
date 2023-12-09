import 'package:rotteck_messenger/domain/entities/clubs/club.dart';
import 'package:rotteck_messenger/domain/entities/events/event.dart';
import 'package:rotteck_messenger/domain/entities/general/blackboard.dart';
import 'package:rotteck_messenger/domain/entities/general/class.dart';
import 'package:rotteck_messenger/domain/entities/general/course.dart';
import 'package:rotteck_messenger/domain/entities/general/grade.dart';
import 'package:rotteck_messenger/domain/entities/general/subject.dart';
import 'package:rotteck_messenger/domain/entities/messages/message.dart';
import 'package:rotteck_messenger/domain/entities/users/user.dart';

class School {

  late String name;
  late List<Grade> grades;
  late List<Course> courses;
  late List<User> members;
  late List<Class> classes;
  late List<Message> messages;
  late List<Subject> subjects;
  late List<Club> clubs;
  late List<Event> events;
  late List<Blackboard> blackboards;

  School({
    required this.name,
    required this.grades,
    required this.courses,
    required this.members,
    required this.classes,
    required this.messages,
    required this.subjects,
    required this.clubs,
    required this.events,
    required this.blackboards
  });

}