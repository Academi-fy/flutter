import 'dart:convert';

import 'package:rotteck_messenger/data/database/http_client.dart';
import 'package:rotteck_messenger/data/models/chat_data_model.dart';
import 'package:rotteck_messenger/domain/entities/messages/chat.dart';

import 'package:rotteck_messenger/domain/repositories/chat_repository.dart';

class ChatRepositoryImplementation extends ChatRepository {
  final AppHTTPClient httpClient;
  ChatRepositoryImplementation({required this.httpClient});

  @override
  Future<ChatEntity> getChatById(String chatId) async {
    final response = await httpClient.get('chats/$chatId');

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);

      final ChatDataModel chatDataModel = ChatDataModel.fromJson(decodedJson);

      final ChatEntity chat = ChatEntity(
        id: chatDataModel.id,
        type: chatDataModel.type,
        targets: chatDataModel.targets,
        courses: chatDataModel.courses,
        clubs: chatDataModel.clubs,
        name: chatDataModel.name,
        avatar: chatDataModel.avatar,
        messages: chatDataModel.messages,
      );

      return chat;
    } else {
      throw Exception('Error fetching chat');
    }
  }
}
