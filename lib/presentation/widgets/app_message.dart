import 'package:flutter/material.dart';
import 'package:rotteck_messenger/domain/entities/message.dart';

class AppMessage extends StatelessWidget {

final Message message;

  const AppMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Test"),
    );
  }
}