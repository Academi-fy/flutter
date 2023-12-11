class BlackboardEntity {
  late String title;
  late dynamic author;
  late String coverImage;
  late String text;
  late List<dynamic> tags;
  late dynamic date;
  late String state;

  BlackboardEntity(
      {required this.title,
      required this.author,
      required this.coverImage,
      required this.text,
      required this.tags,
      required this.date,
      required this.state});
}
