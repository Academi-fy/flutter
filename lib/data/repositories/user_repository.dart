import 'package:dio/dio.dart';
import 'package:rotteck_messenger/data/models/user_model.dart';
import 'package:rotteck_messenger/di/dependency_injection.dart';

class UserRepository {
  Future<UserModel> getUserById(String id) async {
    final response = await getIt.get<Dio>().get("/users/$id");
    print(response);
    return UserModel.fromJson(response.data);
  }
}
