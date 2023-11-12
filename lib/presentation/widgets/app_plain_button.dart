import 'package:flutter/material.dart';
import 'package:rotteck_messenger/presentation/widgets/app_colors.dart';

class AppPlainButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const AppPlainButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.blackText),
      ),
    );
  }
}
