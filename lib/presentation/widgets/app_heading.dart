import 'package:flutter/material.dart';

class AppHeading extends StatelessWidget {
  final String text;
  final String? caption;

  final Image? image;

  const AppHeading({
    super.key,
    required this.text,
    this.caption,
    this.image,
  });

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
            fontFamily: "MagicRetro",
            color: colorPrimary,
            fontSize: 40,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: Text(
                caption != null ? caption! : "",
                textAlign: TextAlign.start,
                maxLines: null,
                style: TextStyle(
                    color: colorSecondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            if (image != null)
              Flexible(child: SizedBox(width: 60, child: image!)),
          ],
        ),
      ],
    );
  }
}
