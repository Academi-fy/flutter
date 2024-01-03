import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rotteck_messenger/data/fake_database/mock_interceptor.dart';
import 'package:rotteck_messenger/data/repositories/user_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() async {
  await dotenv.load(fileName: ".env");
  final baseUrl = dotenv.env['BASE_URL'];

  print("dependencies are getting set up");

  getIt.registerSingleton<Interceptor>(MockInterceptor());
  getIt.registerSingleton(Dio(BaseOptions(baseUrl: baseUrl!))
    ..interceptors.add(getIt<Interceptor>()));
  getIt.registerSingleton(UserRepository());
}
