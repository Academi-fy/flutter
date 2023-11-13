import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rotteck_messenger/presentation/widgets/app_colors.dart';

class AppButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String? iconLocation;
  final Color? color;

  AppButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.iconLocation,
      this.color});

  @override
  Widget build(BuildContext context) {
    Color buttonColor = color != null ? color! : AppColors.highlight;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, top: 13, bottom: 13, right: 13),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              iconLocation != null
                  ? SvgPicture.asset(
                      iconLocation!,
                      color: Colors.white,
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
