import 'package:rotteck_messenger/domain/entities/messages/chat.dart';

abstract class ChatRepos {
  Future<Chat> getChatById(String chatId);
}
