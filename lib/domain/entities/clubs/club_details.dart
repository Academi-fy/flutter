import 'package:rotteck_messenger/domain/entities/clubs/club_requirement.dart';
import 'package:rotteck_messenger/domain/entities/tag.dart';

class ClubDetails {

  late String coverImage;
  late String description;
  late String location;
  late String meetingTime;
  late String meetingDay;
  late List<ClubRequirement> requirements;
  late List<Tag> tags;

  ClubDetails({
    required this.coverImage,
    required this.description,
    required this.location,
    required this.meetingTime,
    required this.meetingDay,
    required this.requirements,
    required this.tags
  });

}