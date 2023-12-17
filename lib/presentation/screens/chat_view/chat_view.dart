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

    void abort() {}

    void appBarItemTapped() {
      showModalBottomSheet<int>(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return AppBottomPopup(
                header: "Neuen Chat erstellen",
                description:
                    "Bitte wähle aus, für welchen Zweck der Chat genutzt werden soll.",
                children: [
                  PopupItem(header: "Einzelchat", onTap: newChat),
                  PopupItem(header: "Gruppenchat", onTap: newGroup),
                  PopupItem(header: "AG", onTap: newClub),
                  PopupItem(
                    header: "Zurück",
                    onTap: abort,
                    isDismiss: true,
                  )
                ]);
          });
    }

    return FutureBuilder<ChatEntity>(
        future: chatRepository.getChatById(chatId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            print(snapshot.data!.messages.runtimeType);
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
