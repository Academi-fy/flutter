import 'package:flutter/material.dart';
import 'package:rotteck_messenger/domain/entities/chat.dart';

class AppChatList extends StatelessWidget {
  const AppChatList({super.key});

  @override
  Widget build(BuildContext context) {
    listItemBuilder(Chat chat) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(chat.name!,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w800)),
                    Text(
                      "14:28",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                Text(
                    "📸 C.Thoböll: Lieber Deutschkurs, hier kommt noch die Hausaufgabe, die ihr auf morgen erledigen sollt. Die Aufgaben sind Klausurrelevant. Also bitte auch wirklich erledigen.",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ],
            ),
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
                const Text("I'm dedicating every day to you"),
                const Text('Domestic life was never quite my style'),
                const Text('When you smile, you knock me out, I fall apart'),
                const Text('And I thought I was so smart'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
