import 'package:flutter/material.dart';
import 'package:rotteck_messenger/presentation/widgets/app_app_bar%20(app_search_field).dart';
import 'package:rotteck_messenger/presentation/widgets/app_bottom_popup.dart';
import 'package:rotteck_messenger/presentation/widgets/app_error_message.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    void onFilterTapped() {}

    void newGroup() {}

    void newClub() {}

    void newChat() {}

    void appBarItemTapped() {
      showModalBottomSheet<int>(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return AppBottomPopup(children: [
              PopupItem(
                  onTap: newChat,
                  title: "Neuer Chat",
                  description: "Zum Austausch mit einem Schüler"),
              PopupItem(
                  onTap: newGroup,
                  title: "Neue Gruppe",
                  description: "Zum Austausch mit mehreren Schülern"),
              PopupItem(
                onTap: newClub,
                title: "Neue AG",
                description: "Zum Austausch innerhalb einer AG",
                isFancy: true,
              )
            ]);
          });
    }

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 20),
                child: AppAppBar(
                  title: "Chats",
                  iconPath: "assets/icons/AddCircleBold.svg",
                  onTap: appBarItemTapped,
                  searchField: true,
                  controller: searchController,
                  onFilterTapped: onFilterTapped,
                ),
              ),
            ),
            const AppErrorMessage(
                message: "Keine Chats gefunden",
                action:
                    "Starte einen neuen Chat über das Plus-Symbol oben rechts."),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
