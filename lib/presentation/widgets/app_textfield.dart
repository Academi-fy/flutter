import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String text;
  final String? iconLocation;

  const AppTextField(
      {super.key,
      this.obscureText = false,
      this.iconLocation,
      required this.text,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        autocorrect: false,
        enableSuggestions: false,
        style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 14,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: text,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            icon: iconLocation != null
                ? SvgPicture.asset(
                    iconLocation!,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )
                : const SizedBox()),
      ),
    );
  }
}
