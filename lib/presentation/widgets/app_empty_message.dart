import 'package:flutter/material.dart';

class AppEmptyMessage extends StatelessWidget {
  final String message;
  final String action;

  const AppEmptyMessage(
      {super.key, required this.message, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      constraints: const BoxConstraints(maxWidth: 300),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          color: Theme.of(context).colorScheme.primary),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Text(message,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w800)),
                ),
                Image.asset(width: 50, "assets/images/sad_face_emoji.png"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              action,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
