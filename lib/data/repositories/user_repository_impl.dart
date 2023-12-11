import 'package:rotteck_messenger/data/database/http_client.dart';
import 'package:rotteck_messenger/data/models/user_data_model.dart';
import 'package:rotteck_messenger/domain/entities/users/user.dart';
import 'package:rotteck_messenger/domain/repositories/user_repository.dart';

class UserRepositoryImplementation extends UserRepository {
  final AppHTTPClient httpClient;
  UserRepositoryImplementation({required this.httpClient});

  @override
  Future<User> getUserById(String userId) async {
    final response = await httpClient.get('/users/$userId');
    if (response.statusCode == 200) {
      final UserDataModel userDataModel = UserDataModel.fromJson(response.body);
      User user = User(
          id: userDataModel.id,
          firstName: userDataModel.firstName,
          lastName: userDataModel.lastName,
          type: userDataModel.type,
          classes: userDataModel.classes,
          extraCourses: userDataModel.extraCourses,
          blackboards: userDataModel.blackboards);
      return user;
    } else {
      throw Exception('Error fetching user');
    }
  }
}
