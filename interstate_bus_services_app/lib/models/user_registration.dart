class UserRegistration {
  Map<dynamic, dynamic> announcements;
  String username;
  String lName;
  String fName;
  String idNumber;
  String phoneNumber;
  String password;
  String? objectId;
  DateTime? created;
  DateTime? updated;

  UserRegistration({
    required this.announcements,
    required this.username,
    required this.fName,
    required this.lName,
    required this.phoneNumber,
    required this.idNumber,
    required this.password,
    this.objectId,
    this.created,
    this.updated,
  });

  // Converts the announcements Map to Json
  Map<String, Object?> toJson() => {
        'username': username,
        'announcements': announcements,
        'fName': fName,
        'lName': lName,
        'phoneNumber': phoneNumber,
        'idNumber': idNumber,
        'password': password,
        'objectId': objectId,
        'created': created,
        'updated': updated,
      };

  // Converts the announcements Json to Map
  static UserRegistration fromJson(Map<dynamic, dynamic>? json) =>
      UserRegistration(
        username: json!['username'] as String,
        announcements: json['announcements'] as Map<dynamic, dynamic>,
        lName: json['lName'] as String,
        fName: json['fName'] as String,
        phoneNumber: json['phoneNumber'] as String,
        idNumber: json['idNumber'] as String,
        password: json['password'] as String,
        objectId: json['objectId'] as String,
        created: json['created'] as DateTime,
        updated: json['updated'] as DateTime,
      );
}
