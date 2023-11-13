import 'package:flutter/material.dart';

class AppHeading extends StatelessWidget {
  final String text;
  final String? caption;
  final double size;
  final double captionSize;
  final Image? image;
  final List<double> offset;

  const AppHeading(
      {super.key,
      required this.text,
      this.caption,
      this.size = 40,
      this.captionSize = 15,
      this.image,
      this.offset = const [190.0, -15]});

  @override
  Widget build(BuildContext context) {
    Color colorPrimary = Theme.of(context).colorScheme.inversePrimary;
    Color colorSecondary = Theme.of(context).colorScheme.onPrimary;

    return Column(
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
        Row(
          children: [
            Text(
              caption != null ? caption! : "",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: colorSecondary,
                  fontWeight: FontWeight.w500,
                  fontSize: captionSize),
            ),
            const SizedBox(
              width: 20,
            ),
            if (image != null) SizedBox(width: 60, child: image!),
          ],
        ),
      ],
    );
  }
}
