class ChatEntity {
  late String id;
  late String? type;
  late List<dynamic>? targets;
  late List<dynamic>? courses;
  late List<dynamic>? clubs;
  late String? name;
  late String? avatar;
  late List<dynamic>? messages;

  ChatEntity({
    required this.id,
    this.type,
    this.targets,
    this.courses,
    this.clubs,
    this.name,
    this.avatar,
    this.messages,
  });
}
