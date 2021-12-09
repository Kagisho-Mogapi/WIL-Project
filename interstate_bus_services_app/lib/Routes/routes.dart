import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Pages/buy_ticket.dart';
import 'package:interstate_bus_services_app/Pages/chat.dart';
import 'package:interstate_bus_services_app/Pages/create_schedule.dart';
import 'package:interstate_bus_services_app/Pages/create_announcement.dart';
import 'package:interstate_bus_services_app/Pages/edit_profile_page.dart';
import 'package:interstate_bus_services_app/Pages/home.dart';
import 'package:interstate_bus_services_app/Pages/loading.dart';
import 'package:interstate_bus_services_app/Pages/login_page.dart';
import 'package:interstate_bus_services_app/Pages/payment_details.dart';
import 'package:interstate_bus_services_app/Pages/profile_page.dart';
import 'package:interstate_bus_services_app/Pages/qrPage.dart';
import 'package:interstate_bus_services_app/Pages/successPage.dart';
import 'package:interstate_bus_services_app/Pages/topup_balance.dart';
import 'package:interstate_bus_services_app/Pages/reset_password.dart';
import 'package:interstate_bus_services_app/Pages/signUp_page.dart';
import 'package:interstate_bus_services_app/Pages/view_announcement.dart';
import 'package:interstate_bus_services_app/Pages/view_bought_tickets.dart';
import 'package:interstate_bus_services_app/Pages/view_bus_schedule.dart';
import 'package:interstate_bus_services_app/Pages/view_user_tickets.dart';
import 'package:interstate_bus_services_app/Pages/welcome_page.dart';
import 'package:interstate_bus_services_app/widgets/area_and_day_choice.dart';

// A class to manage page routes
class RouteManager {
  static const String newHome = '/new home';

  static const String loading = '/loading';
  static const String welcome = '/';
  static const String register = '/register';
  static const String login = '/login';
  static const String resetPassword = '/login/reset password';
  static const String home = '/login/home';
  static const String chooseBusRoute = '/login/chooseBusRoute';
  static const String balanceDetails = '/login/home/balanceDetails';
  static const String chatting = '/login/home/chatting';
  static const String userTickets = '/login/userTickets';
  static const String messages = '/login/home/messages';
  static const String buy = '/login/home/Buy';
  static const String purchaseDetails = '/login/home/Buy/PuchaseDetails';
  static const String successfulTopup =
      '/login/home/Buy/PuchaseDetails/successfulTopup';
  static const String boughtHistory =
      '/login/home/Buy/PuchaseDetails/boughtHistory';
  static const String history = '/login/home/history';
  static const String schedule = '/login/home/schedule';
  static const String writeSchedule = '/login/home/schedule/writeSchedule';
  static const String balance = '/login/home/balance';
  static const String announcements = '/login/home/announcements';
  static const String writeAnnouncements =
      '/login/home/announcements/writeAnnouncements';
  static const String profile = '/login/home/profile';
  static const String scanQR = '/login/home/scanQR';
  static const String editProfile = '/login/home/profile/edit profile';
  ////////////////
  static const String paymentDetails = '/login/home/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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

      case buy:
        return MaterialPageRoute(builder: (context) => BuyForUser());

      case boughtHistory:
        return MaterialPageRoute(builder: (context) => ViewMyBoughtTicket());

      case userTickets:
        return MaterialPageRoute(builder: (context) => ViewUserTickets());

      case chooseBusRoute:
        return MaterialPageRoute(builder: (context) => AreaAndDayChoice());

      case messages:
        return MaterialPageRoute(builder: (context) => Chat());

      case newHome:
        return MaterialPageRoute(builder: (context) => Home());

      case balanceDetails:
        return MaterialPageRoute(builder: (context) => TopupBalance());

      case successfulTopup:
        return MaterialPageRoute(builder: (context) => SuccessPage());

      case schedule:
        return MaterialPageRoute(builder: (context) => ViewBusSchedule());

      case writeSchedule:
        return MaterialPageRoute(builder: (context) => CreateSchedule());

      case scanQR:
        return MaterialPageRoute(builder: (context) => QrPage());

      case announcements:
        return MaterialPageRoute(builder: (context) => ViewAnnouncement());

      case writeAnnouncements:
        return MaterialPageRoute(builder: (context) => CreateAnnouncement());

      case profile:
        return MaterialPageRoute(builder: (context) => ProfilePage());

      case editProfile:
        return MaterialPageRoute(builder: (context) => EditProfile());

      // case messages:
      //   return MaterialPageRoute(builder: (context) => MessagePage());

      case paymentDetails:
        return MaterialPageRoute(builder: (context) => PaymentDetails());

      default:
        throw FormatException('Route not found, check route again');
    }
  }
}
