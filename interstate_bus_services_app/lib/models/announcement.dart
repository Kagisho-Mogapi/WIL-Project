class Announcement {
  final String title;
  // Done is from example that task has been complete
  //bool done;
  final DateTime created;

  Announcement({
    required this.title,
    //this.done = false,
    required this.created,
  });

  Map<String, Object?> toJson() => {
        'title': title,
        //'done': done ? 1 : 0,
        'created': created.millisecondsSinceEpoch,
      };

  static Announcement fromJson(Map<dynamic, dynamic>? json) => Announcement(
        title: json!['title'] as String,
        //done: json['done'] == 1 ? true : false,
        created: DateTime.fromMillisecondsSinceEpoch(
            (json['created'] as double).toInt()),
      );

  // Checks for title duplicates
  @override
  bool operator ==(covariant Announcement announcement) {
    return (this
            .title
            .toUpperCase()
            .compareTo(announcement.title.toUpperCase()) ==
        0);
  }

  @override
  int get hashCode {
    return title.hashCode;
  }
}

Map<dynamic, dynamic> convertAnnouncementListToMap(
    List<Announcement> announcements) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < announcements.length; i++) {
    map.addAll({'$i': announcements[i].toJson()});
  }
  return map;
}

List<Announcement> convertMapToAnnouncementList(Map<dynamic, dynamic> map) {
  List<Announcement> announcements = [];
  for (var i = 0; i < map.length; i++) {
    announcements.add(Announcement.fromJson(map['$i']));
  }
  return announcements;
}
