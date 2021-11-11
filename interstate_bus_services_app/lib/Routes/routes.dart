import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Pages/edit_profile_page.dart';
import 'package:interstate_bus_services_app/Pages/home_page.dart';
import 'package:interstate_bus_services_app/Pages/profile_page.dart';
import 'package:interstate_bus_services_app/Pages/welcome_page.dart';

class RouteManager {
  //TODO: Change routes after Adding a Page
  static const String start = '/';
  static const String home = '/home';
  static const String Buy = '/home/Buy';
  static const String history = '/home/history';
  static const String schedule = '/home/schedule';
  static const String balance = '/home/balance';
  static const String announcements = '/home/announcements';
  static const String profile = '/home/profile';
  static const String getQR = '/home/getQR';
  static const String editProfile = '/home/profile/edit profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //TODO: Add routes of other pages once are finished
      case start:
        return MaterialPageRoute(builder: (context) => WelcomePage());

      case home:
        return MaterialPageRoute(builder: (context) => HomePage());

      case profile:
        return MaterialPageRoute(builder: (context) => ProfilePage());

      case editProfile:
        return MaterialPageRoute(builder: (context) => EditProfile());

      default:
        throw FormatException('Route not found, check route again');
    }
  }
}
