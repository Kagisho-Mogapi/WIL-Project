import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';

class UserService with ChangeNotifier {
  Backendless? _currentUser;
  Backendless? get currentUser => _currentUser;
}
