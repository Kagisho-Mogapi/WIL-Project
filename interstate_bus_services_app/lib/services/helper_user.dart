import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
import 'package:provider/provider.dart';

void createNewUserInUI(BuildContext context,
    {required String email,
    required String password,
    required String name}) async {
  // to remove focus from field
  FocusManager.instance.primaryFocus?.unfocus();

  if (email.isEmpty || name.isEmpty || password.isEmpty) {
    showSnackBar(context, 'Please Enter All Fields');
  }
  // Set User Details
  else {
    BackendlessUser user = BackendlessUser()
      ..email = email.trim()
      ..password = password.trim()
      ..putProperties({
        'name': name.trim(),
      });
    //Custom columns here

    // Sends user details to {createUser} function
    String result = await context.read<UserService>().createUser(user);

    if (result != 'Ok') {
      showSnackBar(context, result);
    } else {
      showSnackBar(context, 'Account Created!!!');
      Navigator.of(context).pushNamed(RouteManager.login);
    }
  }
}

void loginUserInUI(BuildContext context,
    {required String phoneNumber, required String password}) async {
  FocusManager.instance.primaryFocus?.unfocus();

  // Check for empty fields
  if (phoneNumber.isEmpty || password.isEmpty) {
    showSnackBar(context, 'Please Enter All Fields');
  }
  // if no empty fields were found
  else {
    String result = await context
        .read<UserService>()
        .loginUser(phoneNumber.trim(), password.trim());
    // if anything wrong it shows snack bar error message
    if (result != 'Ok') {
      showSnackBar(context, result);
    }
    // if everything went ok with the login process
    else {
      Navigator.of(context).popAndPushNamed(RouteManager.home);
    }
  }
}
