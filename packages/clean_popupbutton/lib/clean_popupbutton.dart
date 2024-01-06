library clean_popupbutton;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CleanPopupButton extends StatefulWidget {
  final GlobalKey globalButtonKey = GlobalKey();
  final GlobalKey globalBoxKey = GlobalKey();

  final Function()? onTap;
  final List<PopupButtonItem> items;
  final Widget child;

  CleanPopupButton({
    super.key,
    this.onTap,
    required this.items,
    required this.child,
  });

  @override
  State<CleanPopupButton> createState() => _CleanPopupButtonState();
}

class _CleanPopupButtonState extends State<CleanPopupButton> {
  double scale = 1.0;
  void changeScale(double newScale) {
    setState(() {
      scale = newScale;
    });
  }

  @override
  Widget build(BuildContext context) {
    final popupButtonContainer = CleanPopupButtonContainer(
        items: widget.items,
        changeScale: changeScale,
        globalButtonKey: widget.globalButtonKey,
        context: context);
    return GestureDetector(
      key: widget.globalButtonKey,
      onTap: widget.onTap,
      onLongPress: () {
        popupButtonContainer.present();
        setState(() {
          scale = 0.9;
        });
      },
      child: AnimatedScale(
          scale: scale,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          child: widget.child),
    );
  }
}

class CleanPopupButtonContainer extends StatefulWidget {
  final GlobalKey globalButtonKey;
  final List<PopupButtonItem> items;
  final Function(double) changeScale;
  final BuildContext context;

  const CleanPopupButtonContainer({
    super.key,
    required this.globalButtonKey,
    required this.items,
    required this.changeScale,
    required this.context,
  });

  static OverlayEntry? overlayEntry;

  void dismiss() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
      changeScale(1.0);
    }
  }

  Offset _getParentWidgetPosition() {
    final renderBox =
        globalButtonKey.currentContext!.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    return offset;
  }

  double _getParentWidgetHeight() {
    final renderBox =
        globalButtonKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  void present() {
    if (CleanPopupButtonContainer.overlayEntry == null) {
      overlayEntry = CleanPopupButtonContainer(
              items: items,
              changeScale: changeScale,
              globalButtonKey: globalButtonKey,
              context: context)
          .createOverlayEntry();

      Overlay.of(context).insert(overlayEntry!);
    } else {
      return;
    }
  }

  bool _showOnTop() {
    final offset = _getParentWidgetPosition();
    final displayHeight = MediaQuery.of(context).size.height;
    if (offset.dy > displayHeight / 2) {
      return true;
    } else {
      return false;
    }
  }

  OverlayEntry createOverlayEntry() {
    Offset offset = _getParentWidgetPosition();
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: dismiss,
            behavior: HitTestBehavior.opaque,
            child: Container(color: Colors.transparent),
          ),
          _showOnTop()
              ? Positioned(
                  left: offset.dx,
                  bottom: MediaQuery.of(context).size.height - offset.dy,
                  child: CleanPopupButtonContainer(
                      items: items,
                      changeScale: changeScale,
                      globalButtonKey: globalButtonKey,
                      context: context))
              : Positioned(
                  left: offset.dx,
                  top: offset.dy + _getParentWidgetHeight(),
                  child: CleanPopupButtonContainer(
                      items: items,
                      changeScale: changeScale,
                      globalButtonKey: globalButtonKey,
                      context: context))
        ],
      ),
    );
  }

  @override
  State<CleanPopupButtonContainer> createState() =>
      _CleanPopupButtonContainerState();
}

class _CleanPopupButtonContainerState extends State<CleanPopupButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 7, right: 7, top: 7, bottom: 1),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var item in widget.items)
                    Column(
                      children: [
                        Row(
                          children: [Flexible(child: item)],
                        ),
                        const SizedBox(
                          height: 6,
                        )
                      ],
                    )
                ],
              ),
            ),
            GestureDetector(
              onTap: widget.dismiss,
            )
          ],
        ),
      ),
    );
  }
}

class PopupButtonItem extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color iconColor;
  final String description;
  final String? iconLocation;

  final Function() onTap;

  const PopupButtonItem(
      {super.key,
      this.iconLocation,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.iconColor,
      required this.description,
      required this.onTap});

  static PopupButtonItem simpleItem(
      String description, Function() onTap, BuildContext context,
      [String? iconLocation]) {
    return PopupButtonItem(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconColor: Theme.of(context).colorScheme.inversePrimary,
        iconLocation: iconLocation,
        description: description,
        onTap: onTap);
  }

  static PopupButtonItem highlightItem(
      String description, Function() onTap, BuildContext context,
      [String? iconLocation]) {
    return PopupButtonItem(
        backgroundColor: Theme.of(context).highlightColor,
        foregroundColor: Colors.white,
        iconColor: Colors.white,
        iconLocation: iconLocation,
        description: description,
        onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              if (iconLocation != null)
                Row(
                  children: [
                    SvgPicture.asset(
                      iconLocation!,
                      color: iconColor,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 6.0,
                    )
                  ],
                ),
              Text(
                description,
                style: TextStyle(
                    color: foregroundColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
