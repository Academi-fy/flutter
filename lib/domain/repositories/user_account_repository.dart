import 'package:rotteck_messenger/domain/entities/users/user_account.dart';

abstract class UserAccountRepository {
  Future<UserAccountEntity> getUserAccountById(String userAccountId);
  Future<bool> authenticateUser(String username, String password);
}
