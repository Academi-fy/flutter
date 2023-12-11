import 'dart:ffi';

class MessageEntity {
  late String id;
  late dynamic user;
  late dynamic chat;
  late List<dynamic> content;
  late List<dynamic> reactions;
  late List<dynamic> edits;
  late Long date;

  MessageEntity(
      {required this.id,
      required this.user,
      required this.chat,
      required this.content,
      required this.reactions,
      required this.edits,
      required this.date});
}
