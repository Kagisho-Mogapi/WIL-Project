import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Pages/message_page.dart';
import 'package:interstate_bus_services_app/Pages/payment_details.dart';
import 'package:interstate_bus_services_app/Pages/profile_page.dart';
import 'package:interstate_bus_services_app/Pages/purchase_history.dart';
import 'package:interstate_bus_services_app/Pages/purchase_page.dart';
import 'package:interstate_bus_services_app/Pages/(og)qrPage.dart';
import 'package:interstate_bus_services_app/Pages/view_announcement.dart';
import 'package:interstate_bus_services_app/Pages/view_bus_schedule.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/helper_user.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/search_bar.dart';
import 'package:provider/provider.dart';
// import 'package:interstate_bus_services_app/Pages/welcome_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.home);
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orangeAccent,
                        spreadRadius: 2,
                        blurRadius: 3,
                        // offset: Offset(0, 7),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/images/Interstatelogo.jpg'),
                    ),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(50)),
                  ),
                ),
                SearchBar(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Covid19Image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Background2.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              padding: EdgeInsets.all(0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/Unity.jpeg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      context
                          .read<UserService>()
                          .currentUser!
                          .getProperty('fName'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text('Dashboard'),
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteManager.newHome);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.account_balance_wallet),
                    title: Text('Account Top Up'),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.balanceDetails);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PurchasePage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.history_edu),
                    title: Text('Purchase History'),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.boughtHistory);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PurchaseHistory()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.schedule),
                    title: Text('View Schedule'),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.chooseBusRoute);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ViewBusSchedule()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.announcement),
                    title: Text('Annoucements'),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.announcements);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ViewAnnouncement()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.preview_outlined),
                    title: Text('View Profile'),
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteManager.profile);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ProfilePage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.qr_code_2),
                    title: Text('Scan QR'),
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteManager.scanQR);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => QrPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Messages'),
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteManager.messages);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MessagePage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.payment_sharp),
                    title: Text('Payment Details'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentDetails()));
                    },
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log out'),
                    onTap: () {
                      logoutUserInUI(context);
                    },
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
