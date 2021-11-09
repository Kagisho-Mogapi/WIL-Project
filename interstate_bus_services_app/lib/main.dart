import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]); //For the top and bottom tabs
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteManager.start,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
