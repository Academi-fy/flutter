import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rotteck_messenger/data/database/mongo_db_client.dart';
import 'package:rotteck_messenger/data/repositories/chat_repository_impl.dart';
import 'package:rotteck_messenger/data/repositories/user_repository_impl.dart';
import 'package:rotteck_messenger/domain/repositories/chat_repository.dart';
import 'package:rotteck_messenger/domain/repositories/user_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  final connectionString = dotenv.env['MONGODB_SERVER_CONNECTION'];

  final db = MongoDBClient(connectionString: connectionString!);
  db.connect();

  getIt.registerSingleton<MongoDBClient>(db);
  getIt.registerSingleton<UserRepository>(
      UserRepositoryImpl(mongoDBClient: getIt<MongoDBClient>()));

  getIt.registerSingleton<ChatRepository>(
      ChatRepositoryImpl(mongoDBClient: getIt<MongoDBClient>()));
}
