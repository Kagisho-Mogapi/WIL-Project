import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      //bottomLeft: Radius.circular(10),
                      //bottomRight: Radius.circular(10),
                      ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.white],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/Unity.jpeg'),
                  ),
                ),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 15),
                ProfileDetails(detailName: 'First Name'),
                SizedBox(height: 15),
                ProfileDetails(detailName: 'Last Name'),
                SizedBox(height: 15),
                ProfileDetails(detailName: 'ID Number'),
                SizedBox(height: 15),
                ProfileDetails(detailName: 'Email'),
                SizedBox(height: 30),
                ViewProfileButtons(
                    btnName: 'Edit Profile',
                    routeName: RouteManager.editProfile),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text(
                    'Go Home',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    fixedSize: MaterialStateProperty.all(Size.fromWidth(220)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key, required this.detailName}) : super(key: key);

  final String detailName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detailName,
          style: TextStyle(
            color: Colors.purple[600],
            fontSize: 15,
          ),
        ),
        Text(
          '{{Profile Details Here}}',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class ViewProfileButtons extends StatelessWidget {
  const ViewProfileButtons({
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
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        fixedSize: MaterialStateProperty.all(Size.fromWidth(220)),
      ),
    );
  }
}
