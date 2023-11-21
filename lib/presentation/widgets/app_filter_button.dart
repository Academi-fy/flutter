import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppFilterButton extends StatelessWidget {
  final Function() onTap;

  const AppFilterButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 50,
      ),
      height: double.maxFinite,
      decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(6),
        child: SvgPicture.asset(
          "assets/icons/FilterBold.svg",
          color: Colors.white,
        ),
      ),
    );
  }
}
