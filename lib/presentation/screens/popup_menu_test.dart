import 'package:flutter/material.dart';
import 'package:rotteck_messenger/presentation/widgets/app_button.dart';

class PopupMenuTest extends StatelessWidget {
  const PopupMenuTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Row(
        children: [
          AppButton.simpleButton(context, "PopupTest", () => null),
        ],
      )),
    );
  }
}
