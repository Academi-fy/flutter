class ChatEntity {
  late String? id;
  late String? type;
  late List<String>? targets;
  late List<String>? courses;
  late List<String>? clubs;
  late String? name;
  late String? avatar;
  late List<String>? messages;

  ChatEntity({
    this.id,
    this.type,
    this.targets,
    this.courses,
    this.clubs,
    this.name,
    this.avatar,
    this.messages,
  });
}
