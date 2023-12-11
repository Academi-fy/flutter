import 'package:rotteck_messenger/domain/entities/messages/chat.dart';

abstract class ChatRepository {
  Future<ChatEntity> getChatById(String chatId);
}
