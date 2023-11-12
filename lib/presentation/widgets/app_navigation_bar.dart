import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rotteck_messenger/presentation/widgets/app_colors.dart';

class AppNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) navItemTapped;
  const AppNavigationBar(
      {super.key, required this.currentIndex, required this.navItemTapped});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int _currentIndex = 0;
  void _setIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
    print("Hallo");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _appBarIconBuilder("assets/icons/ChatRoundBold.svg",
            "assets/icons/ChatRound.svg", 0, "Chats", 110.0),
        _appBarIconBuilder("assets/icons/LetterBold.svg",
            "assets/icons/Letter.svg", 1, "Inbox", 105.0),
        _appBarIconBuilder("assets/icons/SettingsBold.svg",
            "assets/icons/Settings.svg", 2, "Einstellungen", 150,
            animationDuration: const Duration(milliseconds: 600)),
      ],
    );
  }

  Widget _appBarIconBuilder(String iconPath, String iconDeselected, int index,
      String label, double widthExpanded,
      {Duration animationDuration = const Duration(milliseconds: 400)}) {
    bool isSelected = index == _currentIndex;
    return GestureDetector(
      onTap: () {
        _setIndex(index);
        widget.navItemTapped;
      },
      child: AnimatedContainer(
        width: isSelected ? widthExpanded : 54,
        duration: animationDuration,
        curve: Curves.easeInOutBack,
        decoration: BoxDecoration(
            color: isSelected ? AppColors.highlight : AppColors.blackPrimary,
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                isSelected ? iconPath : iconDeselected,
                color: Colors.white,
              ),
              SizedBox(
                width: isSelected ? 10 : 0,
              ),
              isSelected
                  ? Text(
                      label,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  : const SizedBox(
                      width: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
