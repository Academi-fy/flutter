import 'dart:ffi';

class EventEntity {
  late String title;
  late String description;
  late String location;
  late String host;
  late List<dynamic> clubs;
  late Long startDate;
  late Long endDate;
  late List<dynamic> information;
  late List<dynamic> tickets;
  late String state;
  late List<dynamic> editHistory;
  late List<dynamic> subscribers;

  EventEntity(
      {required this.title,
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
      required this.subscribers});
}
