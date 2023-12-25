import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rotteck_messenger/presentation/widgets/app_button.dart';
import 'package:rotteck_messenger/presentation/widgets/app_popup/popup_helper.dart';

class AppPopupMessage extends StatelessWidget {
  final String heading;
  final String caption;
  final String iconPath;
  final Color highlightColor;
  final List<AppButton>? actions;

  const AppPopupMessage(
      {super.key,
      required this.heading,
      required this.caption,
      required this.iconPath,
      this.actions,
      required this.highlightColor});

  static AppPopupMessage generateError(
    String heading,
    String caption, [
    List<AppButton>? actions,
  ]) {
    return AppPopupMessage(
      heading: heading,
      caption: caption,
      iconPath: "assets/icons/DangerTriangleBold.svg",
      highlightColor: Colors.red,
      actions: actions,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 13, 13, 18),
      decoration: BoxDecoration(
          color: currentTheme.colorScheme.primary,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: highlightColor, width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 0)
          ]),
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 35,
                color: highlightColor,
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading,
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: currentTheme.colorScheme.inversePrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        caption,
                        style: TextStyle(
                            color: currentTheme.colorScheme.onPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  PopupHelper.dispose();
                },
                child: SizedBox(
                    width: 13,
                    height: 13,
                    child: SvgPicture.asset("assets/icons/cancel.svg",
                        color: currentTheme.colorScheme.onPrimary)),
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: actions == null
                ? [
                    const SizedBox(
                      height: 0,
                    )
                  ]
                : [
                    for (var action in actions!) Flexible(child: action),
                  ],
          ),
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
