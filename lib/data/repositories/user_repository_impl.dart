import 'package:mongo_dart/mongo_dart.dart';
import 'package:rotteck_messenger/data/database/mongo_db_client.dart';
import 'package:rotteck_messenger/data/exceptions.dart';
import 'package:rotteck_messenger/data/models/user_data_model.dart';
import 'package:rotteck_messenger/domain/entities/user.dart';
import 'package:rotteck_messenger/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final MongoDBClient mongoDBClient;

  UserRepositoryImpl({required this.mongoDBClient});

  @override
  Future<User> getUserById(String userId) async {
    final collection = mongoDBClient.database.collection('users');
    final document = await collection.findOne(where.eq('id', userId));

    if (document == null) {
      throw NotFoundException('User with ID $userId not found');
    }

    UserDataModel userDataModel = UserDataModel.fromJson(document);

    final user = User(
      id: userDataModel.id,
      firstName: userDataModel.firstName,
      lastName: userDataModel.lastName,
      avatar: userDataModel.avatar,
      type: userDataModel.type,
      classes: userDataModel.classes,
      extraCourses: userDataModel.extraCourses,
      createdAt: userDataModel.createdAt,
      updatedAt: userDataModel.updatedAt,
    );

    return user;
  }
}
