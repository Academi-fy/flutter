import 'package:rotteck_messenger/domain/entities/clubs/club_details.dart';
import 'package:rotteck_messenger/domain/entities/events/event.dart';
import 'package:rotteck_messenger/domain/entities/messages/chat.dart';
import 'package:rotteck_messenger/domain/entities/users/user.dart';

class Club {

  late String name;
  late ClubDetails details;
  late List<User> leaders;
  late List<User> members;
  late Chat chat;
  late List<Event> events;
  late String state;
  late List<Club> editHistory;

  Club({
    required this.name,
    required this.details,
    required this.leaders,
    required this.members,
    required this.chat,
    required this.events,
    required this.state,
    required this.editHistory
  });

}