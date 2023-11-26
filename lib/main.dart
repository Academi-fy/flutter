import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rotteck_messenger/di/dependency_injection.dart';
import 'package:rotteck_messenger/presentation/screens/login.dart';
import 'package:rotteck_messenger/themes/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rotteck-messenger',
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
