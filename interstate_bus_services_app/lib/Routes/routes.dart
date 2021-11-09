import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Pages/edit_profile_screen.dart';
import 'package:interstate_bus_services_app/Pages/home_screen.dart';
import 'package:interstate_bus_services_app/Pages/profile_screen.dart';

class RouteManager {
  //TODO: Change routes after combination
  static const String home = '/';
  static const String Buy = '/Buy';
  static const String history = '/history';
  static const String schedule = '/schedule';
  static const String balance = '/balance';
  static const String announcements = '/announcements';
  static const String profile = '/profile';
  static const String getQR = '/getQR';
  static const String editProfile = '/profile/edit profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //TODO: Add routes of other pages once are finished
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case profile:
        return MaterialPageRoute(builder: (context) => ProfileScreen());

      case editProfile:
        return MaterialPageRoute(builder: (context) => EditProfile());

      default:
        throw FormatException('Route not found, check route again');
    }
  }
}
