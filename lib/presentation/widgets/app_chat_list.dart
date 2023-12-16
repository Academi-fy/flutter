import 'package:flutter/material.dart';
import 'package:rotteck_messenger/domain/entities/messages/chat.dart';

class AppChatList extends StatelessWidget {
  final List<ChatEntity> chats;

  const AppChatList({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    listItemBuilder(ChatEntity chat) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.network(
                      chat.avatar!,
                      fit: BoxFit.cover,
                    ))),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  chat.name!,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
              ],
            )
          ],
        ),
      );
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                for (var chat in chats) listItemBuilder(chat),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
