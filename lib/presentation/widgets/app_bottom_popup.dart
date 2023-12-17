import 'package:flutter/material.dart';

class AppBottomPopup extends StatelessWidget {
  final String? header;
  final String? description;
  const AppBottomPopup(
      {super.key, required this.children, this.header, this.description});

  final List<PopupItem> children;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
          color: currentTheme.colorScheme.primary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTopBar(context),
            if (header != null && description != null)
              _buildTitle(context, header!, description!),
            for (var item in children)
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: item)
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String header, String description) {
    final currentTheme = Theme.of(context);
    return Column(
      children: [
        Text(
          header,
          style: TextStyle(
              color: currentTheme.colorScheme.inversePrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: currentTheme.colorScheme.onPrimary,
              fontSize: 13,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 1,
          decoration: BoxDecoration(
              color: currentTheme.colorScheme.background,
              borderRadius: BorderRadius.circular(2.5)),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
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

class PopupItem extends StatelessWidget {
  final String header;
  final Function() onTap;
  final String? description;
  final bool isDismiss;
  const PopupItem(
      {super.key,
      required this.header,
      this.description,
      this.isDismiss = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return GestureDetector(
        onTap: onTap(),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: currentTheme.colorScheme.background,
              borderRadius: BorderRadius.circular(15)),
          height: 50,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child: Text(
              header,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDismiss
                    ? Theme.of(context).indicatorColor
                    : Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
