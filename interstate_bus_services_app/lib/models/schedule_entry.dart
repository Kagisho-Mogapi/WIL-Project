class ScheduleEntry {
  Map<dynamic, dynamic> schedules;
  String username;
  String? objectId;
  // Has errors
  /*DateTime? created;
  DateTime? updated;*/

  ScheduleEntry({
    required this.schedules,
    required this.username,
    this.objectId,
    /*this.created,
    this.updated,*/
  });

  // Converts the schedules Map to Json
  Map<String, Object?> toJson() => {
        'username': username,
        'schedules': schedules,
        'objectId': objectId,
        /*'created': created,
        'updated': updated,*/
      };

  // Converts the schedules Json to Map
  static ScheduleEntry fromJson(Map<dynamic, dynamic>? json) => ScheduleEntry(
        username: json!['username'] as String,
        schedules: json['schedules'] as Map<dynamic, dynamic>,
        objectId: json['objectId'] as String,
        /*created: json['created'] as DateTime,
        updated: json['updated'] as DateTime,*/
      );
}
