import 'package:flutter/material.dart';

class AppErrorMessage extends StatelessWidget {
  final String message;
  final String action;
  final String imagePath;

  const AppErrorMessage(
      {super.key,
      required this.message,
      required this.action,
      this.imagePath = "assets/images/sad_face_emoji.png"});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 0,
                child: Text(message,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.w800)),
              ),
              const SizedBox(
                width: 20,
              ),
              Opacity(
                opacity: 0.5,
                child: Image.asset(
                  imagePath,
                  width: 50,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            action,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 10,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
