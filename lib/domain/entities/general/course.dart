class Course {
  final List<String>? members;
  final List<String>? classes;
  final String teacher;
  final String chat;
  final String subject;
  final DateTime createdAt;
  final DateTime updatedAt;

  Course({
    this.members,
    this.classes,
    required this.teacher,
    required this.chat,
    required this.subject,
    required this.createdAt,
    required this.updatedAt,
  });
}
