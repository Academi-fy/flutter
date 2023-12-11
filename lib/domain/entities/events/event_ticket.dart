import 'dart:ffi';

class EventTicketEntity {
  late dynamic event;
  late dynamic buyer;
  late int price;
  late Long saleDate;

  EventTicketEntity(
      {required this.event,
      required this.buyer,
      required this.price,
      required this.saleDate});
}
