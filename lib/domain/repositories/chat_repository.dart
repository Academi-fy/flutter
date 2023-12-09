import 'package:rotteck_messenger/domain/entities/chat.dart';

abstract class ChatRepos {
  Future<Chat> getChatById(String chatId);
}
