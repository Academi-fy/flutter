import 'package:mongo_dart/mongo_dart.dart';

class MongoDBClient {
  var _db;

  final String connectionString;

  MongoDBClient({required this.connectionString});

  Db get database => _db;

  connect() async {
    _db = await Db.create(connectionString);
    await _db.open();
  }
}
