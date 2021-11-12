class AnnouncementEntry {
  Map<dynamic, dynamic> announcements;
  String phoneNumber;
  String? objectId;
  DateTime? created;
  DateTime? updated;

  AnnouncementEntry({
    required this.announcements,
    required this.phoneNumber,
    this.objectId,
    this.created,
    this.updated,
  });

  // Converts the announcements Map to Json
  Map<String, Object?> toJson() => {
        'phoneNumber': phoneNumber,
        'announcements': announcements,
        'objectId': objectId,
        'created': created,
        'updated': updated,
      };

  // Converts the announcements Json to Map
  static AnnouncementEntry fromJson(Map<dynamic, dynamic>? json) =>
      AnnouncementEntry(
        phoneNumber: json!['phoneNumber'] as String,
        announcements: json['announcements'] as Map<dynamic, dynamic>,
        objectId: json['objectId'] as String,
        created: json['created'] as DateTime,
        updated: json['updated'] as DateTime,
      );
}