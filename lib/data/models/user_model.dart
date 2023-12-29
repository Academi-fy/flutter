class UserModel {
  String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? avatar;
  final List<String> clubs;
  final List<String> courses;
  final List<String> events;
  final String firstName;
  final String lastName;
  final List<String> messages;
  final List<String> schools;
  final String type;
  final String userAccount;
  final List<String> chats;
  final List<String> eventTickets;

  UserModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.avatar,
    required this.clubs,
    required this.courses,
    required this.events,
    required this.firstName,
    required this.lastName,
    required this.messages,
    required this.schools,
    required this.type,
    required this.userAccount,
    required this.chats,
    required this.eventTickets,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        avatar: json["avatar"],
        clubs: List<String>.from(json["clubs"].map((x) => x)),
        courses: List<String>.from(json["courses"].map((x) => x)),
        events: List<String>.from(json["events"].map((x) => x)),
        firstName: json["firstName"],
        lastName: json["lastName"],
        messages: List<String>.from(json["messages"].map((x) => x)),
        schools: List<String>.from(json["schools"].map((x) => x)),
        type: json["type"],
        userAccount: json["userAccount"],
        chats: List<String>.from(json["chats"].map((x) => x)),
        eventTickets: List<String>.from(json["eventTickets"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "avatar": avatar,
        "clubs": List<dynamic>.from(clubs.map((x) => x)),
        "courses": List<dynamic>.from(courses.map((x) => x)),
        "events": List<dynamic>.from(events.map((x) => x)),
        "firstName": firstName,
        "lastName": lastName,
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "schools": List<dynamic>.from(schools.map((x) => x)),
        "type": type,
        "userAccount": userAccount,
        "chats": List<dynamic>.from(chats.map((x) => x)),
        "eventTickets": List<dynamic>.from(eventTickets.map((x) => x)),
      };
}
