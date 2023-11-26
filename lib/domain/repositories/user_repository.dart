import 'package:rotteck_messenger/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUserById(String userId);
}