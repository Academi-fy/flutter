import 'package:rotteck_messenger/domain/entities/users/user.dart';

abstract class UserRepository {
  Future<UserEntitiy> getUserById(String userId);
}
