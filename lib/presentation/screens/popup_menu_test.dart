import 'package:clean_popupbutton/clean_popupbutton.dart';
import 'package:flutter/material.dart';
import 'package:rotteck_messenger/presentation/widgets/app_button.dart';

class PopupMenuTest extends StatelessWidget {
  const PopupMenuTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            for (int i = 0; i < 30; i++)
              Container(
                margin: const EdgeInsets.all(10),
                child: CleanPopupButton(
                    items: [
                      PopupButtonItem.simpleItem("Pin", () => null, context),
                      PopupButtonItem.simpleItem("Test", () => null, context),
                      PopupButtonItem.highlightItem("Dismiss", () => null,
                          context, "assets/icons/EyeScanBold.svg"),
                    ],
                    child: AppButton.simpleButton(
                        context, "Show Popup", () => null)),
              ),
          ],
        ));
  }
}
