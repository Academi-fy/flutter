import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rotteck_messenger/presentation/widgets/app_filter_button.dart';

class AppAppBar extends StatelessWidget {
  final String title;
  final String? iconPath;
  final bool searchField;
  final TextEditingController? controller;
  final Function()? onTap;
  final Function()? onFilterTapped;

  const AppAppBar(
      {super.key,
      required this.title,
      this.iconPath,
      this.controller,
      this.searchField = false,
      this.onTap,
      this.onFilterTapped});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 35,
                  fontWeight: FontWeight.w800),
            ),
            const Spacer(),
            if (iconPath != null && onTap != null)
              GestureDetector(
                  onTap: onTap!,
                  child: SvgPicture.asset(
                    iconPath!,
                    height: 35,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )),
          ],
        ),
        if (searchField && controller != null)
          const SizedBox(
            height: 10,
          ),
        if (searchField && controller != null)
          Flexible(
              child: AppSearchField(
                  controller: controller!, onFilterTapped: onFilterTapped!))
      ],
    );
  }
}

class AppSearchField extends StatefulWidget {
  final TextEditingController controller;
  final Function()? onFilterTapped;
  const AppSearchField(
      {super.key, required this.controller, this.onFilterTapped});

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    void toggle() {
      setState(() {
        focused = !focused;
      });
    }

    return GestureDetector(
      onTap: () {
        toggle();
        print("toggled");
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceInOut,
        height: focused ? 500 : 50,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                onEditingComplete: () {
                  print("TextField tapped");
                  toggle();
                },
                textAlignVertical: TextAlignVertical.center,
                controller: widget.controller,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(11),
                      child: SvgPicture.asset(
                        "assets/icons/Magnifer.svg",
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    hintText: "Suchen",
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            if (widget.onFilterTapped != null)
              Container(
                  padding: const EdgeInsets.all(8),
                  child: AppFilterButton(onTap: widget.onFilterTapped!))
          ],
        ),
      ),
    );
  }
}
