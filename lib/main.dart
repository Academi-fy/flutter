import 'package:flutter/material.dart';
import 'package:rotteck_messenger/presentation/screens/login.dart';
import 'package:rotteck_messenger/themes/theme.dart';

void main() {
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
      darkTheme: darMode,
      home: Login(),
    );
  }
}
