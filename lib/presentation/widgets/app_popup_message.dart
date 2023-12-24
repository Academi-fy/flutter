import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppPopupMessage extends StatelessWidget {
  final String heading;
  final String caption;
  final String iconPath;
  final List<Widget>? actions;
  final Color highlightColor;
  const AppPopupMessage(
      {super.key,
      required this.heading,
      required this.caption,
      required this.iconPath,
      this.actions,
      required this.highlightColor});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: currentTheme.colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: highlightColor, width: 2),
          boxShadow: [
            BoxShadow(
                color: currentTheme.colorScheme.inversePrimary.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5)
          ]),
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              SizedBox(
                  height: 20,
                  child: SvgPicture.asset("assets/icons/cancel.svg",
                      color: currentTheme.colorScheme.onPrimary)),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                iconPath,
                color: highlightColor,
              )
            ],
          )
        ],
      ),
    );
  }

  buildError() {}
}

enum Type {
  live,
  error,
  warning,
  info,
}
