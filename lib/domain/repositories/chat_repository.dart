import 'package:rotteck_messenger/domain/entities/messages/chat.dart';

abstract class ChatRepository {
  Future<Chat> getChatById(String chatId);
}
