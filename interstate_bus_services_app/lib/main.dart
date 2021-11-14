import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:provider/provider.dart';

import 'Routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // List of providers
          ChangeNotifierProvider(create: (context) => UserService()),
        ],
        child: MaterialApp(
          initialRoute: RouteManager.loading,
          onGenerateRoute: RouteManager.generateRoute,
        ));
  }
}
