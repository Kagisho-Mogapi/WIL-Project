class User {
  final String email;

  User({required this.email});

  Map<String, Object?> toJson() => {
        'email': email,
        //'done': done ? 1 : 0,
        //'created': created.millisecondsSinceEpoch,
      };

  static User fromJson(String email) => User(
        email: email,
      );
}

Map<dynamic, dynamic> convertUserListToMap(List<User> users) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < users.length; i++) {
    map.addAll({'$i': users[i].toJson()});
  }
  return map;
}

String convertMapToUserList(String email) {
  List<User> users = [];

  users.add(User.fromJson(email));

  return email;
}
