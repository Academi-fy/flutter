import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rotteck_messenger/presentation/widgets/app_blurred_gradient.dart';

class AppBottomPopup extends StatelessWidget {
  const AppBottomPopup({super.key, required this.children});

  final List<PopupItem> children;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(15),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 30)
          ],
          color: currentTheme.colorScheme.background,
          borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(context),
            for (var item in children)
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: item)
          ],
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final currentTheme = Theme.of(context);
    return FractionallySizedBox(
      widthFactor: 0.15,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
              color: currentTheme.colorScheme.onPrimary,
              borderRadius: const BorderRadius.all(Radius.circular(2.5))),
        ),
      ),
    );
  }
}

class PopupItem extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String description;
  final bool isFancy;
  const PopupItem(
      {super.key,
      required this.onTap,
      required this.title,
      required this.description,
      this.isFancy = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 86),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              !isFancy
                  ? Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                            width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  : SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: AppBlurredBackground(drops: [
                        Drop(
                          color: Color.fromARGB(255, 22, 31, 156),
                          positionX: 0,
                          positionY: 0,
                          width: 0.5,
                          height: 0.5,
                          opacity: 0.1,
                        ),
                        Drop(
                          color: Color.fromARGB(255, 148, 28, 40),
                          positionX: 1,
                          positionY: 1,
                          width: 0.5,
                          height: 0.5,
                          opacity: 0.1,
                        ),
                        Drop(
                            color: Colors.red,
                            positionX: 0.1,
                            positionY: 4,
                            width: 0.5,
                            height: 0.5,
                            opacity: 0.1,
                            spreadRadius: 0.005),
                      ]),
                    ),
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: isFancy
                                  ? Colors.white
                                  : Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          description,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: isFancy
                                  ? Colors.white
                                  : Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                        )
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icons/AltArrowRight.svg",
                      color: isFancy
                          ? Colors.white
                          : Theme.of(context).colorScheme.inversePrimary,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
