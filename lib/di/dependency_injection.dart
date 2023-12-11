import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rotteck_messenger/data/database/http_client.dart';
import 'package:rotteck_messenger/data/repositories/user_repository_impl.dart';
import 'package:rotteck_messenger/domain/repositories/user_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() async {
  await dotenv.load(fileName: ".env");
  final baseUrl = dotenv.env['BASE_URL'];

  print("dependencies are getting set up");

  getIt.registerSingleton<AppHTTPClient>(AppHTTPClient(baseUrl: baseUrl!));
  getIt.registerSingleton<UserRepository>(
      UserRepositoryImplementation(httpClient: getIt.get<AppHTTPClient>()));
}
