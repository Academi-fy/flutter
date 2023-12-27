import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String? iconLocation;
  final Color backgroundColor;
  final Color foregroundColor;

  static AppButton simpleButton(context, String text, Function() onTap,
      [String? iconLocation]) {
    return AppButton(
      text: text,
      onTap: onTap,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      iconLocation: iconLocation,
    );
  }

  static AppButton blueButton(context, contest, String text, Function() onTap,
      [String? iconLocation]) {
    return AppButton(
      text: text,
      onTap: onTap,
      backgroundColor: Colors.blue, //TODO: Change to themecolor
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      iconLocation: iconLocation,
    );
  }

  static AppButton highlightButton(context, String text, Function() onTap,
      [String? iconLocation]) {
    return AppButton(
      text: text,
      onTap: onTap,
      backgroundColor: Theme.of(context).highlightColor,
      foregroundColor: Colors.white,
      iconLocation: iconLocation,
    );
  }

  const AppButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.iconLocation,
      required this.backgroundColor,
      required this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    double rightPadding = iconLocation != null ? 13 : 18;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(11)),
        child: Padding(
          padding: EdgeInsets.only(
              left: 18, top: 13, bottom: 13, right: rightPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: foregroundColor),
              ),
              iconLocation != null
                  ? SvgPicture.asset(
                      iconLocation!,
                      color: foregroundColor,
                    )
                  : const SizedBox(
                      width: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
