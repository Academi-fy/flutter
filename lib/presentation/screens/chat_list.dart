import 'package:flutter/material.dart';
import 'package:rotteck_messenger/presentation/widgets/app_app_bar%20(app_search_field).dart';
import 'package:rotteck_messenger/presentation/widgets/app_navigation_bar.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    TextEditingController searchController = TextEditingController();

    void navItemTapped(int index) {
      print("NavItem Tapped...");
      currentIndex = index;
    }

    void appBarItemTapped() {
      print("AppNavItem Tapped...");
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: AppAppBar(
                    title: "Chats",
                    iconPath: "assets/icons/AddCircleBold.svg",
                    onTap: appBarItemTapped,
                    searchField: true,
                    controller: searchController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: currentIndex,
        navItemTapped: navItemTapped,
      ),
    );
  }
}
