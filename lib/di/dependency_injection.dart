import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rotteck_messenger/data/database/mongo_db_client.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  final connectionString = dotenv.env['MONGODB_SERVER_CONNECTION'];

  final db = MongoDBClient(connectionString: connectionString!);
  db.connect();
}
