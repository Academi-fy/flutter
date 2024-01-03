import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final GlobalKey globalButtonKey = GlobalKey();
final GlobalKey globalBoxKey = GlobalKey();

class AppPopupButton extends StatelessWidget {
  final Function()? onTap;
  final List<PopupButtonItem> items;
  final Widget child;

  AppPopupButton(
      {super.key, this.onTap, required this.items, required this.child});

  @override
  Widget build(BuildContext context) {
    final popupButtonContainer =
        PopupButtonContainer(items: items, context: context);
    return GestureDetector(
      key: globalButtonKey,
      onTap: onTap,
      onLongPress: popupButtonContainer.present,
      child: child,
    );
  }
}

class PopupButtonContainer extends StatefulWidget {
  final List<PopupButtonItem> items;

  final BuildContext context;

  const PopupButtonContainer({
    super.key,
    required this.items,
    required this.context,
  });

  static OverlayEntry? overlayEntry;

  static void dismiss() {
    if (overlayEntry != null) {
      print("dismissing popup");
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }

  Offset _getParentWidgetPosition() {
    final renderBox =
        globalButtonKey.currentContext!.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    print(offset);
    return offset;
  }

  void present() {
    if (PopupButtonContainer.overlayEntry == null) {
      overlayEntry = PopupButtonContainer(items: items, context: context)
          .createOverlayEntry();

      Overlay.of(context).insert(overlayEntry!);
    } else {
      print("there's a popup already, not going to create a second one");
    }
  }

  bool _showOnTop() {
    final offset = _getParentWidgetPosition();
    final displayHeight = MediaQuery.of(context).size.height;
    if (offset.dy < displayHeight / 2) {
      return false;
    } else {
      return true;
    }
  }

  OverlayEntry createOverlayEntry() {
    Offset offset = _getParentWidgetPosition();
    print("showing overlay");
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
                  top: offset.dy + 50,
                  child: PopupButtonContainer(items: items, context: context))
              : Positioned(
                  left: offset.dx,
                  bottom: offset.dy + 50,
                  child: PopupButtonContainer(items: items, context: context))
        ],
      ),
    );
  }

  @override
  State<PopupButtonContainer> createState() => _PopupButtonContainerState();
}

class _PopupButtonContainerState extends State<PopupButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.only(left: 7, right: 7, top: 7, bottom: 1),
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

  static PopupButtonItem highlightButton(
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
                    ),
                    const SizedBox(
                      width: 5.0,
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
