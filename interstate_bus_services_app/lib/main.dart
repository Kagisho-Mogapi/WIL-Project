import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/announcement_service.dart';
import 'package:interstate_bus_services_app/services/schedule_service.dart';
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
          ChangeNotifierProvider(create: (context) => AnnouncementService()),
          ChangeNotifierProvider(create: (context) => ScheduleService()),
        ],
        child: MaterialApp(
          initialRoute: RouteManager.loading,
          onGenerateRoute: RouteManager.generateRoute,
        ));
  }
}
