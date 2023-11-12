import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rotteck_messenger/presentation/widgets/app_colors.dart';

class AppPopup extends StatelessWidget {
  final List<PopupButton> buttons;
  const AppPopup({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [for (var button in buttons) button.getButton()],
    );
  }
}

class PopupButton {
  final String iconPath;
  final String description;

  PopupButton(this.iconPath, this.description);

  Widget getButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.blackTertiary,
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
