import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppPopupButton extends StatelessWidget {
  final List<PopUpButton> actions;

  const AppPopupButton({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PopUpButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final String? iconLocation;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;

  const PopUpButton({
    super.key,
    required this.text,
    required this.onTap,
    this.iconLocation,
    required this.iconColor,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (iconColor == null) iconColor = Theme.of(context).colorScheme.onPrimary;

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200), color: backgroundColor),
        child: Row(
          children: [
            if (iconLocation != null)
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: SvgPicture.asset(
                  iconLocation!,
                  color: iconColor,
                ),
              ),
            Text(
              text,
              style: TextStyle(
                  color: textColor, fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}
