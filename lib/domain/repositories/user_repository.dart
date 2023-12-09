import 'package:rotteck_messenger/domain/entities/users/user.dart';

abstract class UserRepository {
  Future<User> getUserById(String userId);
}