import 'package:flutter/material.dart';
import 'package:rotteck_messenger/presentation/widgets/app_colors.dart';

class AppHeading extends StatelessWidget {
  final String text;
  final String? caption;
  final double size;
  final Image? image;
  final List<double> offset;

  const AppHeading(
      {super.key,
      required this.text,
      this.caption,
      this.size = 30,
      this.image,
      this.offset = const [190.0, -15]});

  @override
  Widget build(BuildContext context) {
    Color colorPrimary = Colors.white;
    Color colorSecondary = AppColors.blackText;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: colorPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: size,
                  height: 1.2),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              caption != null ? caption! : "",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: colorSecondary,
                  fontWeight: FontWeight.w500,
                  fontSize: (size / 2)),
            ),
          ],
        ),
        Positioned(
          left: offset[0],
          top: offset[1],
          child: image != null ? image! : SizedBox(),
        ),
      ],
    );
  }
}
