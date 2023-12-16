import 'package:flutter/material.dart';
import 'package:rotteck_messenger/di/dependency_injection.dart';
import 'package:rotteck_messenger/domain/entities/messages/chat.dart';
import 'package:rotteck_messenger/domain/repositories/chat_repository.dart';
import 'package:rotteck_messenger/presentation/widgets/app_app_bar.dart';
import 'package:rotteck_messenger/presentation/widgets/app_bottom_popup.dart';
import 'package:rotteck_messenger/presentation/widgets/app_chat_list.dart';
import 'package:rotteck_messenger/presentation/widgets/app_error_message.dart';

class ChatView extends StatelessWidget {
  final bool isEmpty;
  final String chatId;
  const ChatView(
      {super.key,
      required this.isEmpty,
      this.chatId = "656cf418a7b20d606810c91f"});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    final chatRepository = getIt<ChatRepository>();

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

    return FutureBuilder<ChatEntity>(
        future: chatRepository.getChatById(chatId),
        builder: (context, AsyncSnapshot<ChatEntity> snapshot) {
          print(snapshot.data!.messages.runtimeType);

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
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
                    isEmpty
                        ? const AppErrorMessage(
                            message: "Keine Chats\ngefunden",
                            action:
                                "Starte einen neuen Chat über das Plus-Symbol oben rechts.")
                        : Expanded(child: AppChatList(chats: [snapshot.data!])),
                    const Spacer()
                  ],
                ),
              ),
            );
          }
        });
  }
}
