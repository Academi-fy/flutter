class ClubEntity {
  late String name;
  late dynamic details;
  late List<dynamic> leaders;
  late List<dynamic> members;
  late dynamic chat;
  late List<dynamic> events;
  late String state;
  late List<dynamic> editHistory;

  ClubEntity(
      {required this.name,
      required this.details,
      required this.leaders,
      required this.members,
      required this.chat,
      required this.events,
      required this.state,
      required this.editHistory});
}
