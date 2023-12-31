import 'package:flutter/material.dart';

class AppPlainButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const AppPlainButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
