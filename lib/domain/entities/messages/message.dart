import 'dart:ffi';
import 'package:rotteck_messenger/domain/entities/messages/chat.dart';
import 'package:rotteck_messenger/domain/entities/users/user.dart';

class Message {

  late String id;
  late User user;
  late Chat chat;
  late List<Object> content;
  late List<Object> reactions;
  late List<Message> edits;
  late Long date;

  Message({
    required this.id,
    required this.user,
    required this.chat,
    required this.content,
    required this.reactions,
    required this.edits,
    required this.date
  });

}
