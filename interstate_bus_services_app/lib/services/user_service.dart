import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';

class UserService with ChangeNotifier {
  Backendless? _currentUser;
  Backendless? get currentUser => _currentUser;

  Future<String> loginUser(String phoneNumber, String password) async {
    String result = 'Ok';

    _showUserProgress = true;
    _userProgressText = 'Logging In.... Please Wait';
    notifyListeners();

    // Logging in a user
    BackendlessUser? user = await Backendless.userService
        .login(phoneNumber, password, true)
        .onError((error, stackTrace) {
      result = getHumanReadableError(error.toString());
    });

    if (user != null) {
      _currentUser = user;
    }

    _showUserProgress = false;
    notifyListeners();

    return result;
  }
}
