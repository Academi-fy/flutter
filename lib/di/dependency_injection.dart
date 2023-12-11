import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rotteck_messenger/data/database/http_client.dart';
import 'package:rotteck_messenger/data/repositories/user_repository_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  final baseUrl = DotEnv().env['BASE_URL'];

  print("dependencies are getting set up");

  getIt.registerSingleton<AppHTTPClient>(AppHTTPClient(baseUrl: baseUrl!));
  getIt.registerSingleton<UserRepositoryImplementation>(
      UserRepositoryImplementation(httpClient: getIt.get<AppHTTPClient>()));
}
