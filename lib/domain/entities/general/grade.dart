import 'package:rotteck_messenger/domain/entities/general/class.dart';

class Grade {

  late int level;
  late List<Class> classes;

  Grade({
    required this.level,
    required this.classes
  });

}