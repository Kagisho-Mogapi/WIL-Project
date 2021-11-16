import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/helper_user.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:provider/provider.dart' as provider;
import 'package:tuple/tuple.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[600],
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/images/Unity.jpeg'),
                    ),
                    SizedBox(height: 5),
                    /*Text(
                      '{{Full Name}}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),*/
                    provider.Selector<UserService, BackendlessUser?>(
                      selector: (context, value) => value.currentUser,
                      builder: (context, value, child) {
                        return value == null
                            ? Container()
                            : Text(
                                "Hello ${value.getProperty('fName')}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 46,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.amber[900],
                                ),
                              );
                      },
                    ),
                    SizedBox(height: 25),
                    HomeScreenButton(
                      btnName: 'Buy Ticket',
                      routeName: '',
                    ),
                    SizedBox(height: 3),
                    HomeScreenButton(
                      btnName: 'Purchase History',
                      routeName: '',
                    ),
                    SizedBox(height: 3),
                    HomeScreenButton(
                      btnName: 'View Schedule',
                      routeName: '',
                    ),
                    SizedBox(height: 3),
                    HomeScreenButton(
                      btnName: 'Balance Details',
                      routeName: '',
                    ),
                    SizedBox(height: 3),
                    HomeScreenButton(
                      btnName: 'Annoucements',
                      routeName: RouteManager.announcements,
                    ),
                    SizedBox(height: 3),
                    HomeScreenButton(
                      btnName: 'View Profile',
                      routeName: RouteManager.profile,
                    ),
                    SizedBox(height: 3),
                    HomeScreenButton(
                      btnName: 'Scan QR',
                      routeName: '',
                    ),
                    SizedBox(height: 3),
                    ElevatedButton(
                      onPressed: () {
                        logoutUserInUI(context);
                      },
                      child: Text('Logout'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        fixedSize:
                            MaterialStateProperty.all(Size.fromWidth(220)),
                      ),
                    ),
                    /*HomeScreenButton(
                      btnName: 'Quit',
                      routeName: '',
                    ),*/
                    SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          ),
          provider.Selector<UserService, Tuple2>(
            selector: (context, value) =>
                Tuple2(value.showUserProgress, value.userProgressText),
            builder: (context, value, child) {
              return value.item1
                  ? AppProgressIndicator(text: value.item2)
                  : Container();
            },
          )
        ],
      ),
    );
  }
}

class HomeScreenButton extends StatelessWidget {
  const HomeScreenButton({
    Key? key,
    required this.btnName,
    required this.routeName,
  }) : super(key: key);

  final String btnName;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        btnName,
        style: TextStyle(fontSize: 15),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(routeName);
        //print(context.read<AnnouncementService>().busyRetrieving);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        fixedSize: MaterialStateProperty.all(Size.fromWidth(220)),
      ),
    );
  }
}
