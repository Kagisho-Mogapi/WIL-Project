class UserListEntry {
  // Map<dynamic, dynamic> users;
  String email;

  UserListEntry({required this.email});

  // Converts the users Map to Json
  Map<String, Object?> toJson() => {
        'email': email,
      };

  // Converts the users Json to Map
  static UserListEntry fromJson(Map<dynamic, dynamic>? json) {
    print(json);
    return UserListEntry(
      email: json!['email'],
    );
  }
}
