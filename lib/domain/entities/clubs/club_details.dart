class ClubDetailsEntity {
  late String coverImage;
  late String description;
  late String location;
  late String meetingTime;
  late String meetingDay;
  late List<dynamic> requirements;
  late List<dynamic> tags;

  ClubDetailsEntity(
      {required this.coverImage,
      required this.description,
      required this.location,
      required this.meetingTime,
      required this.meetingDay,
      required this.requirements,
      required this.tags});
}
