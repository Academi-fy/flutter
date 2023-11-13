import 'package:flutter/material.dart';

class AppDeveloperBanner extends StatelessWidget {
  const AppDeveloperBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Column(
            children: [Text("Developed with")],
          )
        ],
      ),
    );
  }
}
