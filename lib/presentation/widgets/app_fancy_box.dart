import 'dart:ui';
import 'package:flutter/material.dart';

/* Structure:
Stack
  Container
  Gradient
    ClippedRect
      Blur
        child
*/

class AppFancyBox extends StatelessWidget {
  final Gradient gradient;
  final double cornerRadius;
  final Widget child;

  const AppFancyBox(
      {super.key,
      required this.child,
      required this.gradient,
      this.cornerRadius = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        child: Stack(children: [
          Container(
            width: double.maxFinite,
            height: 80,
            decoration: BoxDecoration(gradient: gradient),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
              child: child,
            ),
          ),
        ]));
  }
}
