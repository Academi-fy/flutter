import 'dart:ffi';

import 'package:rotteck_messenger/domain/entities/tag.dart';
import 'package:rotteck_messenger/domain/entities/users/user.dart';

class Blackboard {

  late String title;
  late User author;
  late String coverImage;
  late String text;
  late List<Tag> tags;
  late Long date;
  late String state;

  Blackboard({
    required this.title,
    required this.author,
    required this.coverImage,
    required this.text,
    required this.tags,
    required this.date,
    required this.state
  });

}