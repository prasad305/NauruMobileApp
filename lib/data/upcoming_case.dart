class UpcomingCase {
  UpcomingCase({
    required this.id,
    required this.title,
    required this.court,
    required this.parties,
  });

  int id;
  String title;
  String court;
  String parties;

  factory UpcomingCase.fromJson(Map<String, dynamic> json) => UpcomingCase(
    id: json["id"],
    title: json["title"],
    court: json["court"],
    parties: json["parties"],
  );

}