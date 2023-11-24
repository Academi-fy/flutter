import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rotteck_messenger/data/database/mongo_db_client.dart';
import 'package:rotteck_messenger/data/repositories/user_repository_impl.dart';
import 'package:rotteck_messenger/domain/repositories/user_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  dotenv.load();

  final connectionString = dotenv.env['MONGODB_CONNECTION_STRING'];
  getIt.registerSingleton<MongoDBClient>(MongoDBClient(connectionString!));
  getIt.registerSingleton<UserRepository>(
      UserRepositoryImpl(mongoDBClient: getIt<MongoDBClient>()));
}
