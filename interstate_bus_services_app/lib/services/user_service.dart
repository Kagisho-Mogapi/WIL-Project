import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:interstate_bus_services_app/models/user.dart';
import 'package:interstate_bus_services_app/models/user_list_entry.dart';
import 'package:provider/provider.dart';

class UserService with ChangeNotifier {
  BackendlessUser? _currentUser;
  BackendlessUser? get currentUser => _currentUser;
  static String userEmail = '';
  static double topUpAmount = 0;
  static double subtractAmount = 0;

  UserListEntry? userEntry;
  String users = '';
  String result = 'OK';

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

  Future<String> resetPassword(String username) async {
    String result = 'OK';
    _showUserProgress = true;
    _userProgressText = 'Reseting the password... Please Wait...';
    notifyListeners();

    await Backendless.userService
        .restorePassword(username)
        .onError((error, stackTrace) {
      result = getHumanReadableError(error.toString());
    });
    _showUserProgress = false;
    notifyListeners();

    return result;
  }

  Future<String> logoutUser() async {
    String result = 'OK';

    _showUserProgress = true;
    _userProgressText = 'Signing Out... Please Wait...';
    notifyListeners();

    await Backendless.userService.logout().onError((error, stackTrace) {
      result = error.toString();
    });

    _showUserProgress = false;
    notifyListeners();
    return result;
  }

  void checkIfUserExists(String username) async {
    DataQueryBuilder? queryBuilder = DataQueryBuilder()
      ..whereClause = "email = '$username'";

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
    String result = 'OK';

    _showUserProgress = true;
    _userProgressText = 'Logging In.... Please Wait';
    notifyListeners();

    // Logging in a user
    // .onError gives errors
    BackendlessUser? user = await Backendless.userService
        .login(username, password, true)
        .onError((error, stackTrace) {
      result = getHumanReadableError(error.toString());
    });

    if (user != null) {
      _currentUser = user;
    }
    userEmail = _currentUser!.email;

    _showUserProgress = false;
    notifyListeners();

    return result;
  }

  Future<String> checkIfUserLoggedIn() async {
    String result = 'OK';

    // Checks if there was a valid login
    bool? validLogin = await Backendless.userService
        .isValidLogin()
        .onError((error, stackTrace) {
      result = error.toString();
    });

    if (validLogin != null && validLogin) {
      // Retrives the current user's Object Id
      String? currentUserObjectId = await Backendless.userService
          .loggedInUser()
          .onError((error, stackTrace) {
        result = error.toString();
      });
      if (currentUserObjectId != null) {
        // finds the user from {Users} table using {currentUserObjectId} and retrive
        // their Json
        Map<dynamic, dynamic>? mapOfCurentUser = await Backendless.data
            .of('Users')
            .findById(currentUserObjectId)
            .onError((error, stackTrace) {
          result = error.toString();
        });

        if (mapOfCurentUser != null) {
          _currentUser = BackendlessUser.fromJson(mapOfCurentUser);
          userEmail = _currentUser!.email;

          notifyListeners();
        } else {
          result = 'NOT OK';
        }
      } else {
        result = 'NOT OK';
      }
    } else {
      result = 'NOT OK';
    }
    return result;
  }

  Future<void> updateProfile(
    BuildContext context,
    String fNameEdit,
    String lNameEdit,
    String phoneNumberEdit,
    String passwordEdit,
  ) async {
    Map<dynamic, dynamic> entity = {};
    int? saveChange = -1;

    if (fNameEdit.isNotEmpty) {
      entity.addAll({'fName': '$fNameEdit'});
    }

    if (lNameEdit.isNotEmpty) {
      entity.addAll({'lName': '$lNameEdit'});
    }

    if (phoneNumberEdit.isNotEmpty) {
      entity.addAll({'phoneNumber': '$phoneNumberEdit'});
    }

    if (passwordEdit.isNotEmpty) {
      BackendlessUser? user = context.read<UserService>().currentUser;
      user!.password = passwordEdit;
      Backendless.data
          .of("Users")
          .save(user.toJson())
          .then((response) => print("User password has been changed"));
    }

    saveChange = await Backendless.data.of("Users").update(
        "email ='${context.read<UserService>().currentUser!.email}'", entity);

    print(saveChange);
  }

  Future<void> topUpBalance(
    String username,
  ) async {
    final topUpBalance = await Backendless.data
        .of("Users")
        .update("email ='$username'", {'credits': topUpAmount});
    print('Topup Result: $topUpBalance');
  }

  Future<void> subtractBalance(String username, double diff) async {
    final topUpBalance = await Backendless.data
        .of("Users")
        .update("email ='$username'", {'credits': diff});
    print('Subtract Result: $topUpBalance');
  }

  Future<void> getUsers() async {
    DataQueryBuilder queryBuilder = DataQueryBuilder()
      ..whereClause = "credits ='0'";

    List<Map<dynamic, dynamic>?>? map = await Backendless.data
        .of('Users')
        .find(queryBuilder)
        .onError((error, stackTrace) {
      result = error.toString();
    });

    if (map != null) {
      if (map.length > 0) {
        // !!!! {map.first} because there's only one list per user !!!!!!!!!
        print(map.first);
        print('--------------------------------------------');
        userEntry = UserListEntry.fromJson(map.first);
        users = convertMapToUserList(userEntry!.email);
        notifyListeners();
      } else {
        result = 'NOT OK';
      }

      // int index = 0;
      // while (index < map.length) {
      //   print(map[index]);
      //   index++;
      // }
    }
  }

  Future<String> createUser(BackendlessUser user) async {
    String result = 'OK';

    _showUserProgress = true;
    _userProgressText = 'Creating Account... Please Wait...';
    notifyListeners();

    try {
      // Registers a user
      await Backendless.userService.register(user);
    } catch (e) {
      result = getHumanReadableError(e.toString());
    }

    // When account is successfully created
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
