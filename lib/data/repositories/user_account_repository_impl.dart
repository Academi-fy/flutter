import 'package:rotteck_messenger/data/database/http_client.dart';
import 'package:rotteck_messenger/data/models/user_account_data_model.dart';
import 'package:rotteck_messenger/domain/entities/users/user_account.dart';
import 'package:rotteck_messenger/domain/repositories/user_account_repository.dart';

class UserAccountRepositoryImplementation implements UserAccountRepository {
  final AppHTTPClient httpClient;

  UserAccountRepositoryImplementation({required this.httpClient});

  @override
  Future<bool> authenticateUser(String username, String password) async {
    final response = await httpClient.getWithBody("user-accounts/filter", {
      "filter": {"username": "DopatkaK2A24"}
    });
    if (response.statusCode == 200) {
      final UserAccountDataModel userAccountDataModel =
          UserAccountDataModel.fromJson(response.body);
      if (userAccountDataModel.password == password) {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Error fetching user account');
    }
  }

  Future<UserAccountEntity> getUserAccountById(String userAccountId) async {
    final response = await httpClient.get('user-accounts/$userAccountId');
    if (response.statusCode == 200) {
      final UserAccountDataModel userAccountDataModel =
          UserAccountDataModel.fromJson(response.body);
      UserAccountEntity userAccountEntity = UserAccountEntity(
        id: userAccountDataModel.id,
        username: userAccountDataModel.username,
        password: userAccountDataModel.password,
        user: userAccountDataModel.user,
        permissions: userAccountDataModel.permissions,
      );
      return userAccountEntity;
    } else {
      throw Exception('Error fetching user account');
    }
  }
}
