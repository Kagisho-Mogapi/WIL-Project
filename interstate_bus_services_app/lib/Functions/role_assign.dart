import 'package:flutter/cupertino.dart';
import 'package:interstate_bus_services_app/Functions/user_role.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:provider/provider.dart';

// to assign a role of user depending on the domain of the email
class RoleAssign {
  static void roleAssign(BuildContext context) {
    if (context
        .read<UserService>()
        .currentUser!
        .email
        .contains('@interstate.admin')) {
      UserRole.userRole = 'admin';
    } else if (context
        .read<UserService>()
        .currentUser!
        .email
        .contains('@interstate.driver')) {
      UserRole.userRole = 'driver';
    } else {
      UserRole.userRole = 'commuter';
    }
    print(UserRole.userRole);
  }
}
