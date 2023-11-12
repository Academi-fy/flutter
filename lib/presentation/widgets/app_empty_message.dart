import 'package:flutter/material.dart';

class AppEmptyMessage extends StatelessWidget {
  final String message;
  final String action;

  const AppEmptyMessage(
      {super.key, required this.message, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      constraints: const BoxConstraints(maxWidth: 300),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: [Color(0xFF302E2E), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Text(
                  message,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Positioned(
                    top: 10,
                    left: 60,
                    child: SizedBox(
                        width: 80,
                        child:
                            Image.asset("assets/images/telescope_emoji.png")))
              ],
            ),
            const SizedBox(height: 80),
            Text(
              action,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
