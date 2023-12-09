import 'package:rotteck_messenger/domain/entities/messages/chat.dart';
import 'package:rotteck_messenger/domain/entities/general/class.dart';
import 'package:rotteck_messenger/domain/entities/general/subject.dart';
import 'package:rotteck_messenger/domain/entities/users/user.dart';

class Course {

  late List<User> members;
  late List<Class> classes;
  late User teacher;
  late Chat chat;
  late Subject subject;

  Course({
    required this.members,
    required this.classes,
    required this.teacher,
    required this.chat,
    required this.subject
  });

}