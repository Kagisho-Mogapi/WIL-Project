import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Pages/chatting.dart';
import 'package:interstate_bus_services_app/Pages/create_schedule.dart';
import 'package:interstate_bus_services_app/Pages/create_announcement.dart';
import 'package:interstate_bus_services_app/Pages/edit_profile_page.dart';
import 'package:interstate_bus_services_app/Pages/home_page.dart';
import 'package:interstate_bus_services_app/Pages/loading.dart';
import 'package:interstate_bus_services_app/Pages/login_page.dart';
import 'package:interstate_bus_services_app/Pages/message_page.dart';
import 'package:interstate_bus_services_app/Pages/payment_details.dart';
import 'package:interstate_bus_services_app/Pages/profile_page.dart';
import 'package:interstate_bus_services_app/Pages/reset_password.dart';
import 'package:interstate_bus_services_app/Pages/signUp_page.dart';
import 'package:interstate_bus_services_app/Pages/view_announcement.dart';
import 'package:interstate_bus_services_app/Pages/view_bus_schedule.dart';
import 'package:interstate_bus_services_app/Pages/welcome_page.dart';

class RouteManager {
  //TODO: Change routes after Adding a Page

  static const String loading = '/loading';
  static const String welcome = '/';
  static const String register = '/register';
  static const String login = '/login';
  static const String resetPassword = '/login/reset password';
  static const String home = '/login/home';

  static const String chatting = '/login/home/chatting';
  static const String messages = '/login/home/messages';
  static const String Buy = '/login/home/Buy';
  static const String history = '/login/home/history';
  static const String schedule = '/login/home/schedule';
  static const String writeSchedule = '/login/home/schedule/writeSchedule';
  static const String balance = '/login/home/balance';
  static const String announcements = '/login/home/announcements';
  static const String writeAnnouncements =
      '/login/home/announcements/writeAnnouncements';
  static const String profile = '/login/home/profile';
  static const String getQR = '/login/home/getQR';
  static const String editProfile = '/login/home/profile/edit profile';
  ////////////////
  static const String paymentDetails = '/login/home/';

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

      case resetPassword:
        return MaterialPageRoute(builder: (context) => ResetPassword());

      case home:
        return MaterialPageRoute(builder: (context) => HomePage());

      case chatting:
        return MaterialPageRoute(builder: (context) => Chatting());

      case schedule:
        return MaterialPageRoute(builder: (context) => ViewBusSchedule());

      case writeSchedule:
        return MaterialPageRoute(builder: (context) => CreateSchedule());

      case announcements:
        return MaterialPageRoute(builder: (context) => ViewAnnouncement());

      case writeAnnouncements:
        return MaterialPageRoute(builder: (context) => CreateAnnouncement());

      case profile:
        return MaterialPageRoute(builder: (context) => ProfilePage());

      case editProfile:
        return MaterialPageRoute(builder: (context) => EditProfile());

      case messages:
        return MaterialPageRoute(builder: (context) => MessagePage());

      case paymentDetails:
        return MaterialPageRoute(builder: (context) => PaymentDetails());

      default:
        throw FormatException('Route not found, check route again');
    }
  }
}
