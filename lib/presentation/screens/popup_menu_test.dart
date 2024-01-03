import 'package:flutter/material.dart';
import 'package:rotteck_messenger/presentation/widgets/app_button.dart';
import 'package:rotteck_messenger/presentation/widgets/app_popup_button.dart';

class PopupMenuTest extends StatelessWidget {
  const PopupMenuTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppPopupButton(items: [
              PopupButtonItem.simpleItem("Anpinnen", () => null, context),
              PopupButtonItem.simpleItem("Test", () => null, context),
              PopupButtonItem.simpleItem("Anpinnen", () => null, context),
              PopupButtonItem.simpleItem("Anpinnen", () => null, context),
              PopupButtonItem.simpleItem("Neuer Chat", () => null, context),
            ], child: AppButton.simpleButton(context, "Show Popup", () => null))
          ],
        ),
      ),
    );
  }
}
