import 'dart:ffi';

import 'package:rotteck_messenger/domain/entities/clubs/club.dart';
import 'package:rotteck_messenger/domain/entities/events/event_information.dart';
import 'package:rotteck_messenger/domain/entities/events/event_ticket.dart';

import '../users/user.dart';

class Event {

  late String title;
  late String description;
  late String location;
  late String host;
  late List<Club> clubs;
  late Long startDate;
  late Long endDate;
  late List<EventInformation> information;
  late List<EventTicket> tickets;
  late String state;
  late List<Event> editHistory;
  late List<User> subscribers;

  Event({
    required this.title,
    required this.description,
    required this.location,
    required this.host,
    required this.clubs,
    required this.startDate,
    required this.endDate,
    required this.information,
    required this.tickets,
    required this.state,
    required this.editHistory,
    required this.subscribers
  });

}