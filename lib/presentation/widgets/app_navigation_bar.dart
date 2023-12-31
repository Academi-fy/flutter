import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border(
            top: BorderSide(color: Theme.of(context).colorScheme.outline)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _appBarIconBuilder("assets/icons/ChatRoundBold.svg", 0, "Chats"),
          _appBarIconBuilder("assets/icons/LibraryBold.svg", 1, "News",
              notification: true),
          _appBarIconBuilder("assets/icons/SignpostBold.svg", 2, "AGs"),
          _appBarIconBuilder(
              "assets/icons/Widget6Bold.svg", 3, "Einstellungen"),
        ],
      ),
    );
  }

  Widget _appBarIconBuilder(String iconPath, int index, String label,
      {bool notification = false}) {
    bool isSelected = index == _currentIndex;
    return GestureDetector(
      onTap: () {
        _setIndex(index);
        widget.navItemTapped(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SvgPicture.asset(
                  iconPath,
                  color: isSelected
                      ? Theme.of(context).highlightColor
                      : Theme.of(context).colorScheme.onBackground,
                ),
                if (notification)
                  Container(
                    alignment: Alignment.topLeft,
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).indicatorColor),
                  ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: TextStyle(
                  color: isSelected
                      ? Theme.of(context).highlightColor
                      : Theme.of(context).colorScheme.onBackground,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
