import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/widgets/elevated_btn_a.dart';
import 'package:interstate_bus_services_app/widgets/get_profile_details.dart';
import 'package:interstate_bus_services_app/widgets/water_deep_deco.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(children: [
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/Unity.jpeg'),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        ProfileDetails(
                            detailHeader: 'First Name', detailName: 'fName'),
                        SizedBox(height: 15),
                        ProfileDetails(
                            detailHeader: 'Last Name', detailName: 'lName'),
                        SizedBox(height: 15),
                        ProfileDetails(
                            detailHeader: 'ID Number', detailName: 'idNumber'),
                        SizedBox(height: 15),
                        ProfileDetails(
                            detailHeader: 'Email', detailName: 'email'),
                        SizedBox(height: 15),
                        ProfileDetails(
                            detailHeader: 'ID Number', detailName: 'idNumber'),
                        SizedBox(height: 30),
                      ],
                    ),
                    MyElevatedBtnA(
                        btnName: 'Edit Profile',
                        routeName: RouteManager.editProfile),
                    /*ViewProfileButtons(
                        btnName: 'Edit Profile',
                        routeName: RouteManager.editProfile),*/
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
