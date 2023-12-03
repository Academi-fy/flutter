import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBottomPopup extends StatelessWidget {
  const AppBottomPopup({super.key, required this.children});

  final List<PopupItem> children;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(15),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 30)
          ],
          color: currentTheme.colorScheme.primary,
          borderRadius: BorderRadius.circular(40)),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(context),
            for (var item in children)
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: item)
          ],
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final currentTheme = Theme.of(context);
    return FractionallySizedBox(
      widthFactor: 0.15,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
              color: currentTheme.colorScheme.onPrimary,
              borderRadius: const BorderRadius.all(Radius.circular(2.5))),
        ),
      ),
    );
  }
}

class PopupItem extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String description;
  final bool isFancy;
  const PopupItem(
      {super.key,
      required this.onTap,
      required this.title,
      required this.description,
      this.isFancy = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: isFancy
                ? LinearGradient(colors: [
                    Color.fromARGB(255, 112, 28, 127).withOpacity(1),
                    Color.fromARGB(255, 165, 53, 19).withOpacity(1)
                  ])
                : LinearGradient(colors: [
                    Theme.of(context).colorScheme.background,
                    Theme.of(context).colorScheme.background,
                  ]),
            border: Border.all(color: Theme.of(context).colorScheme.outline)),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: isFancy
                          ? Colors.white
                          : Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: isFancy
                          ? Colors.white
                          : Theme.of(context).colorScheme.inversePrimary),
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              "assets/icons/AltArrowRight.svg",
              color: isFancy
                  ? Colors.white
                  : Theme.of(context).colorScheme.inversePrimary,
            )
          ],
        ),
      ),
    );
  }
}
