import 'package:rotteck_messenger/domain/entities/events/event_information_item.dart';

class EventInformation {

  late String title;
  late List<EventInformationItem> items;

  EventInformation({
    required this.title,
    required this.items
  });

}