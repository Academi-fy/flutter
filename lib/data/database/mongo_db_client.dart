import 'package:mongo_dart/mongo_dart.dart';

class MongoDBClient {
  final Db _db;

  MongoDBClient(String connectionString) : _db = Db(connectionString);

  Future<void> open() async {
    await _db.open();
    print("Connected to MongoDB");
  }

  Db get database => _db;

  Future<void> close() async {
    await _db.close();
    print("Closed connection to MongoDB");
  }
}
