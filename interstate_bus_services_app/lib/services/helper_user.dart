import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
import 'package:provider/provider.dart';

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
