import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays(
      []); //For removal of top and bottom tabs
  runApp(MyApp());
}

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
          initialRoute: RouteManager.welcome,
          onGenerateRoute: RouteManager.generateRoute,
        ));
  }
}
