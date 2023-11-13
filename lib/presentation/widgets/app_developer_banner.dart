import 'package:flutter/material.dart';

class AppDeveloperBanner extends StatelessWidget {
  const AppDeveloperBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Theme.of(context).colorScheme.outline)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Developed with",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Text("by Daniel and Linus",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.inversePrimary)),
            ],
          ),
          const SizedBox(
            width: 3,
          ),
          SizedBox(
              width: 20, child: Image.asset("assets/images/heart_emoji.png"))
        ],
      ),
    );
  }
}
