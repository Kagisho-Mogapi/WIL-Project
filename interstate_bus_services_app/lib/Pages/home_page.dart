import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Functions/user_role.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
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
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Background1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Opacity(
            opacity: 0.85,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.red, Colors.blue]),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: SafeArea(
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
                      UserRole.userRole == 'commuter'
                          ? commuterWidgets(context)
                          : UserRole.userRole == 'admin'
                              ? adminWidgets(context)
                              : UserRole.userRole == 'driver'
                                  ? driverWidgets(context)
                                  : Container(
                                      child: Text('Unknown Role'),
                                    ),
                      MyElevatedBtnA(
                        btnName: 'New home',
                        routeName: RouteManager.newHome,
                        getMeSome: '',
                      ),
                    ],
                  ),
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

Container commuterWidgets(BuildContext context) {
  return Container(
    child: Column(
      children: [
        MyElevatedBtnA(
          btnName: 'Buy Ticket',
          routeName: RouteManager.buy,
          getMeSome: '',
        ),
        MyElevatedBtnA(
          btnName: 'Purchase History',
          routeName: RouteManager.boughtHistory,
          getMeSome: 'tickets',
        ),
        MyElevatedBtnA(
          btnName: 'View Schedule',
          routeName: RouteManager.chooseBusRoute,
          getMeSome: 'schedules',
        ),
        MyElevatedBtnA(
          btnName: 'Balance Details',
          routeName: RouteManager.balanceDetails,
          getMeSome: '',
        ),
        MyElevatedBtnA(
          btnName: 'Annoucements',
          routeName: RouteManager.announcements,
          getMeSome: 'annoucements',
        ),
        MyElevatedBtnA(
          btnName: 'View Profile',
          routeName: RouteManager.profile,
          getMeSome: '',
        ),
        MyElevatedBtnA(
          btnName: 'Scan QR',
          routeName: RouteManager.scanQR,
          getMeSome: '',
        ),
        MyElevatedBtnA(
          btnName: 'Messages',
          routeName: RouteManager.messages,
          getMeSome: '',
        ),
        // MyElevatedBtnA(
        //   btnName: 'Payment Details',
        //   routeName: RouteManager.paymentDetails,
        // ),
      ],
    ),
  );
}

Container adminWidgets(BuildContext context) {
  return Container(
    child: Column(
      children: [
        MyElevatedBtnA(
          btnName: 'Tickets List',
          routeName: RouteManager.userTickets,
          getMeSome: '',
        ),
        MyElevatedBtnA(
          btnName: 'View Schedule',
          routeName: RouteManager.chooseBusRoute,
          getMeSome: 'schedules',
        ),
        MyElevatedBtnA(
          btnName: 'Annoucements',
          routeName: RouteManager.announcements,
          getMeSome: 'annoucements',
        ),
        MyElevatedBtnA(
          btnName: 'View Profile',
          routeName: RouteManager.profile,
          getMeSome: '',
        ),
        MyElevatedBtnA(
          btnName: 'Messages',
          routeName: RouteManager.messages,
          getMeSome: '',
        ),
      ],
    ),
  );
}

Container driverWidgets(BuildContext context) {
  return Container(
    child: Column(
      children: [
        MyElevatedBtnA(
          btnName: 'View Schedule',
          routeName: RouteManager.chooseBusRoute,
          getMeSome: 'schedules',
        ),
        MyElevatedBtnA(
          btnName: 'Annoucements',
          routeName: RouteManager.announcements,
          getMeSome: 'annoucements',
        ),
        MyElevatedBtnA(
          btnName: 'View Profile',
          routeName: RouteManager.profile,
          getMeSome: '',
        ),
        MyElevatedBtnA(
          btnName: 'Messages',
          routeName: RouteManager.messages,
          getMeSome: '',
        ),
      ],
    ),
  );
}
