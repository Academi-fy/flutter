import 'dart:ui';

import 'package:flutter/material.dart';

class AppBlurredBackground extends StatelessWidget {
  final List<Drop> drops;
  final double brightness;

  const AppBlurredBackground(
      {super.key, this.brightness = 1, required this.drops});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double boxHeight = constraints.maxHeight;
      double boxWidth = constraints.maxWidth;
      double boxArea = boxHeight * boxWidth;

      Widget buildDrop(Drop drop) {
        if (drop.spreadRadius == -1) {
          drop.spreadRadius = boxArea * 0.01;
        } else {
          drop.spreadRadius = drop.spreadRadius * boxArea;
        }
        if (drop.blurRadius == -1) {
          drop.blurRadius = boxArea * 0.01;
        } else {
          drop.blurRadius = drop.blurRadius * boxArea;
        }
        return Positioned(
          left: drop.positionX * boxWidth,
          bottom: drop.positionY * boxHeight,
          child: Container(
            width: drop.width * boxWidth,
            height: drop.height * boxHeight,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(1000),
                boxShadow: [
                  BoxShadow(
                      color: drop.color.withOpacity(1 - drop.opacity),
                      spreadRadius: drop.spreadRadius,
                      blurRadius: drop.blurRadius,
                      offset: const Offset(0, 0))
                ]),
          ),
        );
      }

      return ClipRRect(
        child: Container(
          height: boxHeight.toDouble(),
          width: boxWidth.toDouble(),
          color: Colors.black,
          child: Stack(
            children: [
              for (var drop in drops) buildDrop(drop),
              Container(
                color: Colors.black.withOpacity(1 - brightness),
              )
            ],
          ),
        ),
      );
    });
  }
}

class Drop {
  Color color;
  double width;
  double height;
  double positionX;
  double positionY;
  double spreadRadius;
  double opacity;
  double blurRadius;

  Drop(
      {required this.color,
      required this.width,
      required this.height,
      required this.positionX,
      required this.positionY,
      this.spreadRadius = -1,
      this.opacity = 1.0,
      this.blurRadius = -1});
}
