import 'package:flutter/material.dart';

class BottomPopupEntry {
  final BuildContext context;
  final Widget child;
  final Color backgroundColor;
  final bool showFrame;

  BottomPopupEntry(
      {required this.child,
      required this.context,
      this.showFrame = true,
      this.backgroundColor = Colors.transparent});

  void generatePopup() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [if (showFrame) _buildTopBar(context), child],
            ),
          );
        });
  }

  Widget _buildTopBar(BuildContext context) {
    final currentTheme = Theme.of(context);
    return FractionallySizedBox(
      widthFactor: 0.1,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
              color: currentTheme.colorScheme.background,
              borderRadius: const BorderRadius.all(Radius.circular(2.5))),
        ),
      ),
    );
  }
}
