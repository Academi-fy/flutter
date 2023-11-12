import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rotteck_messenger/presentation/widgets/app_colors.dart';

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
          color: AppColors.blackSecondary,
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        autocorrect: false,
        enableSuggestions: false,
        style: TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: text,
            hintStyle: TextStyle(color: AppColors.blackTertiary, fontSize: 14),
            icon: iconLocation != null
                ? SvgPicture.asset(
                    iconLocation!,
                    color: AppColors.blackTertiary,
                  )
                : SizedBox()),
      ),
    );
  }
}
