import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Pages/edit_profile_page.dart';
import 'package:interstate_bus_services_app/Pages/home_page.dart';
import 'package:interstate_bus_services_app/Pages/loading.dart';
import 'package:interstate_bus_services_app/Pages/login_page.dart';
import 'package:interstate_bus_services_app/Pages/profile_page.dart';
import 'package:interstate_bus_services_app/Pages/signUp_page.dart';
import 'package:interstate_bus_services_app/Pages/welcome_page.dart';

class RouteManager {
  //TODO: Change routes after Adding a Page

  static const String loading = '/loading';
  static const String welcome = '/';
  static const String register = '/register';
  static const String login = '/login';
  static const String home = '/login/home';
  static const String Buy = '/login/home/Buy';
  static const String history = '/login/home/history';
  static const String schedule = '/login/home/schedule';
  static const String balance = '/login/home/balance';
  static const String announcements = '/login/home/announcements';
  static const String profile = '/login/home/profile';
  static const String getQR = '/login/home/getQR';
  static const String editProfile = '/login/home/profile/edit profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //TODO: Add routes of other pages once are finished

      case loading:
        return MaterialPageRoute(builder: (context) => Loading());

      case welcome:
        return MaterialPageRoute(builder: (context) => WelcomePage());

      case register:
        return MaterialPageRoute(builder: (context) => SignUpPage());

      case login:
        return MaterialPageRoute(builder: (context) => LoginPage());

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
