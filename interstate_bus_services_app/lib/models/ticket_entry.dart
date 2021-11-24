class TicketEntry {
  Map<dynamic, dynamic> tickets;
  String username;
  String? objectId;
  // Has errors
  /*DateTime? created;
  DateTime? updated;*/

  TicketEntry({
    required this.tickets,
    required this.username,
    this.objectId,
    /*this.created,
    this.updated,*/
  });

  // Converts the tickets Map to Json
  Map<String, Object?> toJson() => {
        'username': username,
        'tickets': tickets,
        'objectId': objectId,
        /*'created': created,
        'updated': updated,*/
      };

  // Converts the tickets Json to Map
  static TicketEntry fromJson(Map<dynamic, dynamic>? json) => TicketEntry(
        username: json!['username'] as String,
        tickets: json['tickets'] as Map<dynamic, dynamic>,
        objectId: json['objectId'] as String,
        /*created: json['created'] as DateTime,
        updated: json['updated'] as DateTime,*/
      );
}
