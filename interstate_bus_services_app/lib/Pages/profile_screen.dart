import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  PprofileStateScreen createState() => PprofileStateScreen();
}

class PprofileStateScreen extends State<ProfileScreen> {
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
            SizedBox(height: 20),
            ProfileDetails(detailName: '{First Name}'),
            SizedBox(height: 20),
            ProfileDetails(detailName: '{Last Name}'),
            SizedBox(height: 20),
            ProfileDetails(detailName: '{ID Number}'),
            SizedBox(height: 20),
            ProfileDetails(detailName: '{Email}'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Edit Profile',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                //Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
                fixedSize: MaterialStateProperty.all(Size.fromWidth(250)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Go Home',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
                fixedSize: MaterialStateProperty.all(Size.fromWidth(250)),
              ),
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
    return Container(
      decoration: BoxDecoration(color: Colors.purple[600]),
      height: 40,
      width: 290,
      child: Center(
          child: Text(
        detailName,
        style: TextStyle(fontSize: 20, color: Colors.white),
      )),
    );
  }
}
