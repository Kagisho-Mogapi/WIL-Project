import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:provider/provider.dart';

// to get updated user table if they are already logged in
Future<void> refreshUserDetails(BuildContext context) async {
  String result = await context.read<UserService>().checkIfUserLoggedIn();

  print('Loggin results: $result');
}
