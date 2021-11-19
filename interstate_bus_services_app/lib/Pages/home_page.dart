import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/helper_user.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/elevated_btn_a.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                logoutUserInUI(context);
              }),
          SizedBox(width: 20),
        ],
      ),
      //backgroundColor: Colors.blue[600],
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              width: 1000,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.lightBlue,
                      Colors.blue.shade900,
                    ]),
              ),
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
                    provider.Selector<UserService, BackendlessUser?>(
                      selector: (context, value) => value.currentUser,
                      builder: (context, value, child) {
                        return value == null
                            ? Container()
                            : Text(
                                "Hello ${value.getProperty('fName')}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              );
                      },
                    ),
                    MyElevatedBtnA(
                      btnName: 'Buy Ticket',
                      routeName: '',
                    ),
                    MyElevatedBtnA(
                      btnName: 'Purchase History',
                      routeName: '',
                    ),
                    MyElevatedBtnA(
                      btnName: 'View Schedule',
                      routeName: '',
                    ),
                    MyElevatedBtnA(
                      btnName: 'Balance Details',
                      routeName: '',
                    ),
                    MyElevatedBtnA(
                      btnName: 'Annoucements',
                      routeName: RouteManager.announcements,
                    ),
                    MyElevatedBtnA(
                      btnName: 'View Profile',
                      routeName: RouteManager.profile,
                    ),
                    MyElevatedBtnA(
                      btnName: 'Scan QR',
                      routeName: '',
                    ),
                    MyElevatedBtnA(
                      btnName: 'Messages',
                      routeName: RouteManager.messages,
                    ),
                    MyElevatedBtnA(
                      btnName: 'Payment Details',
                      routeName: RouteManager.paymentDetails,
                    ),
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
