import 'dart:math';

import 'package:flutter/material.dart';

/* class AppFancyBox extends StatelessWidget {
  final Gradient gradient;
  final double cornerRadius;
  final Widget child;

  const AppFancyBox(
      {super.key,
      required this.child,
      required this.gradient,
      this.cornerRadius = 0});

  @override
  Widget build(BuildContext context, BoxConstraints constraints) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        child: Stack(children: [
          Container(
            height: 80,
            child: ClipRRect(
              child: Container(
                width: double.maxFinite,
                height: 200,
                decoration: BoxDecoration(gradient: gradient),
              ),
            ),
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
*/

class AppFancyBox extends StatelessWidget {
  final BoxDecoration? decoration;
  final List<Color> colors;
  const AppFancyBox({
    super.key,
    this.decoration,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final area = constraints.maxHeight * constraints.maxWidth;
      final dropCount = area / 20.toInt();

      int getRandomRadius(int originRadius) {
        int randomOffset = Random().nextInt(21) - 10;
        return randomOffset.toInt() + originRadius.toInt();
      }

      final double averageDropRadius = area / 5;
      return Positioned(
        top: Random().nextInt(constraints.maxHeight.toInt()).toDouble(),
        left: Random().nextInt(constraints.maxWidth.toInt()).toDouble(),
        child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                for (var drop = 0; drop < dropCount; drop++)
                  _dropBuilder(_getRandomElement(colors),
                      getRandomRadius(averageDropRadius.toInt()))
              ],
            )),
      );
    });
  }
}

Widget _dropBuilder(Color color, int radius) {
  return Container(
    height: radius.toDouble(),
    width: radius.toDouble(),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(120)),
  );
}

_getRandomElement(List list) {
  Random random = Random();
  int randomIndex = random.nextInt(list.length);
  return list[randomIndex];
}
