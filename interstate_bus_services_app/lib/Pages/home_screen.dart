import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[600],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/Unity.jpeg'),
              ),
              SizedBox(height: 5),
              Text(
                '{{Full Name}}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                    routeName: '',
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
                      //SystemNavigator.pop();
                    },
                    child: Text('Exit'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      fixedSize: MaterialStateProperty.all(Size.fromWidth(220)),
                    ),
                  ),
                  /*HomeScreenButton(
                    btnName: 'Quit',
                    routeName: '',
                  ),*/
                  SizedBox(height: 30),
                ],
              )
            ],
          ),
        ),
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
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        fixedSize: MaterialStateProperty.all(Size.fromWidth(220)),
      ),
    );
  }
}
