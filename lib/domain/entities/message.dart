import 'dart:ffi';
import 'package:rotteck_messenger/domain/entities/user.dart';

class Message {
  final String id;
  final User user;
  // final Chat chat;
  // final List<ContentType> content;
  // final List<ContentReactions> reaction;
  // final List<EditedMessage> edits;
  final Long date;
  const Message({required this.id, required this.user, required this.date});
}
