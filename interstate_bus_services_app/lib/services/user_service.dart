import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:interstate_bus_services_app/models/announcement_entry.dart';

class UserService with ChangeNotifier {
  BackendlessUser? _currentUser;
  BackendlessUser? get currentUser => _currentUser;

  bool _userExists = false;
  bool get userExists => _userExists;

  bool _showUserProgress = false;
  bool get showUserProgress => _showUserProgress;

  String _userProgressText = '';
  String get userProgressText => _userProgressText;

  void setCurrentUserNull() {
    _currentUser = null;
  }

  set userExists(bool value) {
    _userExists = value;
    notifyListeners();
  }

  Future<String> resetPassword(String phoneNumber) async {
    String result = 'Ok';
    return result;
  }

  Future<String> logoutUser() async {
    String result = 'Ok';
    return result;
  }

  void checkIfUserExists(String username) async {
    DataQueryBuilder queryBuilder = DataQueryBuilder()
      ..whereClause = "phoneNumber = '$username'";

    await Backendless.data
        .withClass<BackendlessUser>()
        .find(queryBuilder)
        .then((value) {
      // Validating when focus is lost that if user does exits
      if (value == null || value.length == 0) {
        _userExists = false;
        notifyListeners();
      } else {
        _userExists = true;
        notifyListeners();
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  Future<String> loginUser(String username, String password) async {
    String result = 'Ok';

    _showUserProgress = true;
    _userProgressText = 'Logging In.... Please Wait';
    notifyListeners();

    // Logging in a user
    // .onError gives errors
    BackendlessUser? user =
        await Backendless.userService.login(username, password, true);

    if (user != null) {
      _currentUser = user;
    }

    _showUserProgress = false;
    notifyListeners();

    return result;
  }

  Future<String> checkIfUserLoggedIn(String phoneNumber) async {
    String result = 'Ok';
    return result;
  }

  Future<String> createUser(BackendlessUser user) async {
    String result = 'Ok';

    _showUserProgress = true;
    _userProgressText = 'Creating Account... Please Wait...';
    notifyListeners();

    try {
      // Registers a user
      await Backendless.userService.register(user);

      // Create an empty announcement entry
      AnnouncementEntry emptyEntry =
          AnnouncementEntry(announcements: {}, phoneNumber: user.email);

      // Sends the blank entry to the {AnnouncementEntry} table on Backendless
      // .onError gives errors
      await Backendless.data.of('AnnouncementEntry').save(emptyEntry.toJson());
    } catch (e) {
      result = getHumanReadableError(e.toString());
    }

    _showUserProgress = false;
    notifyListeners();

    return result;
  }

  String getHumanReadableError(String message) {
    if (message.contains('email address must be confirmed first')) {
      return 'Please check your inbox and confirm your email address and try to login again.';
    }
    if (message.contains('User already exists')) {
      return 'This user already exists in our database. Please create a new user.';
    }
    if (message.contains('Invalid login or password')) {
      return 'Please check your username or password. The combination do not match any entry in our database.';
    }
    if (message
        .contains('User account is locked out due to too many failed logins')) {
      return 'Your account is locked due to too many failed login attempts. Please wait 30 minutes and try again.';
    }
    if (message.contains('Unable to find a user with the specified identity')) {
      return 'Your email address does not exist in our database. Please check for spelling mistakes.';
    }
    if (message.contains(
        'Unable to resolve host "api.backendless.com": No address associated with hostname')) {
      return 'It seems as if you do not have an internet connection. Please connect and try again.';
    }
    return message;
  }
}
