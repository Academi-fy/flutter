import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PopupHelper {
  static Timer? toastTimer;
  static OverlayEntry? _overlayEntry;

  static void showCustomPopup(BuildContext context, Widget child) {
    if (_overlayEntry == null) {
      _overlayEntry = createOverlayEntry(context, child);

      Overlay.of(context).insert(_overlayEntry!);
      toastTimer = Timer(const Duration(seconds: 5), () {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
          _overlayEntry = null;
        }
      });
    }
  }

  static dispose() {
    if (_overlayEntry != null) {
      if (toastTimer != null) toastTimer!.cancel();
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  static OverlayEntry createOverlayEntry(BuildContext context, Widget child) {
    return OverlayEntry(
        builder: (context) => Positioned(
            bottom: 30,
            right: MediaQuery.of(context).size.width * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Material(
                color: Colors.transparent,
                child: child
                    .animate()
                    .slideY(
                        begin: 2,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 200))
                    .fadeIn())));
  }
}
