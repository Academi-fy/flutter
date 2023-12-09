import 'dart:ffi';

import 'package:rotteck_messenger/domain/entities/events/event.dart';
import 'package:rotteck_messenger/domain/entities/users/user.dart';

class EventTicket {

  late Event event;
  late User buyer;
  late int price;
  late Long saleDate;

  EventTicket({
    required this.event,
    required this.buyer,
    required this.price,
    required this.saleDate
  });

}