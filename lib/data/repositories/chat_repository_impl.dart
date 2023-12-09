import 'package:mongo_dart/mongo_dart.dart';
import 'package:rotteck_messenger/data/database/mongo_db_client.dart';
import 'package:rotteck_messenger/data/exceptions.dart';
import 'package:rotteck_messenger/data/models/chat_data_model.dart';
import 'package:rotteck_messenger/domain/entities/messages/chat.dart';

import 'package:rotteck_messenger/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final MongoDBClient mongoDBClient;

  ChatRepositoryImpl({required this.mongoDBClient});

  @override
  Future<Chat> getChatById(String chatId) async {
    print(await mongoDBClient.database.getCollectionNames());
    final collection = mongoDBClient.database.collection('chats');
    final document =
        await collection.findOne(where.eq('_id', ObjectId.parse(chatId)));

    if (document == null) {
      throw NotFoundException('Chat with ID $chatId not found');
    }
    print(document);
    ChatDataModel chatDataModel = ChatDataModel.fromJson(document);

    final chat = Chat(
      id: chatDataModel.id!,
      type: chatDataModel.type!,
      targets: chatDataModel.targets,
      courses: chatDataModel.courses,
      clubs: chatDataModel.clubs,
      name: chatDataModel.name!,
      avatar: chatDataModel.avatar,
      messages: chatDataModel.messages,
    );

    return chat;
  }
}
