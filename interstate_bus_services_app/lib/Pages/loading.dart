import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/announcement_service.dart';
import 'package:interstate_bus_services_app/services/schedule_service.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:provider/provider.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  static const String SERVER_URL = "https://eu-api.backendless.com";
  static const String APPLICATION_ID = "6C057E8A-5743-1687-FF77-06AE75443400";
  static const String ANDROID_API_KEY = "5771E324-6F0D-4CF2-A813-D9339D3223FD";
  static const String IOS_API_KEY = "6A6097DF-84AC-442F-AEA9-FADDCE16F1CB";
  static const String JS_API_KEY = "CBB3571F-FB60-4DDE-95B3-21615345B79B";
  static const String STREAM_CHAT_API_KEY = "cecfemefmkqf";
  String getStream = '';

  @override
  void initState() {
    super.initState();
    init();
    loadTimer();
  }

  void loadTimer() async {
    String result = await context.read<UserService>().checkIfUserLoggedIn();

    await Future.delayed(Duration(seconds: 2));

    if (result == 'OK') {
      Navigator.popAndPushNamed(context, RouteManager.home);
      context
          .read<AnnouncementService>()
          .getAnnouncements(context.read<UserService>().currentUser!.email);
      context
          .read<ScheduleService>()
          .getSchedules(context.read<UserService>().currentUser!.email);

      if (context.read<UserService>().currentUser!.getProperty('fName') ==
          'Johnney') {
        getStream =
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiam9obm5leSJ9.ZxQBe8iAshCY3zLaMbLGusELOaBSvVF2Tcl2LL42K1I';
      } else if (context
              .read<UserService>()
              .currentUser!
              .getProperty('fName') ==
          'Hephaestus') {
        getStream =
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiaGVwaGFlc3R1cyJ9.qQwKnmhpljgJo9o9ahDKx1b08EH0emcPshOWqReI21U';
      } else {
        getStream =
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFyeSJ9.574p0xc5I8EZWYOTMOx88IAhpgDCGws3p_2-vBTMfUc';
      }
    } else {
      Navigator.popAndPushNamed(context, RouteManager.welcome);
    }
  }

  void init() async {
    await Backendless.setUrl(SERVER_URL);
    await Backendless.initApp(
      applicationId: APPLICATION_ID,
      androidApiKey: ANDROID_API_KEY,
      jsApiKey: JS_API_KEY,
      iosApiKey: IOS_API_KEY,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.lightBlue,
                  Colors.blue.shade900,
                ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.timelapse_outlined,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Loading...please wait...',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: LinearProgressIndicator(
                  minHeight: 7,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
