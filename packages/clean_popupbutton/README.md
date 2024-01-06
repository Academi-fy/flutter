<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


## Features

This package was developed to implement easy to use Popupbuttons with a clean, minimalistic design in Flutter. In order for the popup to work, you must set the background and primary colors of your themedata in Flutter!
You can wrap any widget with the Clean Popupbutton and therefore create actions that appear whenever the child is long pressed.
Depending on where the child is located, the popup either appears at the top or at the bottom of the screen. You can also choose if the child should be animated when clicked.
In future versions, support for haptic feedback is planned.

![Simulator Screenshot - iPhone 15 Pro Max - 2024-01-05 at 00 11 06](https://github.com/Academi-fy/clean_popupbutton/assets/88278635/9bb18d8d-dc63-427e-8058-7d4e69bdff2f)


## Usage

**In order for the popup to work, you must set the background and primary colors of your ThemeData in your Flutter App!**

```dart
CleanPopupButton(
                    items: [
                      PopupButtonItem.simpleItem(
                          "A popupitem", () => null, context),
                      PopupButtonItem.simpleItem("Another popupItem", () => null, context),
                      PopupButtonItem.highlightItem("PopupItem2", () => null,
                          context, "assets/icons/EyeScanBold.svg"),
                    ],
                    child: AppButton.simpleButton(
                        context, "Show Popup", () => null)),
              ),
```

## Additional information

Thank you very much for using this package. If you have any bugs to report, please send them to the author of this package.
