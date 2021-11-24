import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/helper_ticket.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:provider/provider.dart';

class BuyForUser extends StatefulWidget {
  const BuyForUser({Key? key}) : super(key: key);

  @override
  _BuyForUserState createState() => _BuyForUserState();
}

class _BuyForUserState extends State<BuyForUser> {
  bool buyForMe = true;
  TextEditingController toController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController busCodeController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController recipientController = TextEditingController();
  TextEditingController isUsedController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void dispose() {
    toController.dispose();
    fromController.dispose();
    timeController.dispose();
    busCodeController.dispose();
    typeController.dispose();
    recipientController.dispose();
    isUsedController.dispose();
    priceController.dispose();

    super.dispose();
  }

  final List<String> receipients = [
    'Me',
    'Someone',
  ];

  final List<String> locations = [
    'Thaba Nchu',
    'Botshabelo',
    'Bloemfontein',
    'Botshabelo',
  ];

  String? value;
  DropdownMenuItem<String> buildMenuItem(String admin) => DropdownMenuItem(
      value: admin,
      child: Text(
        admin,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ));

  @override
  Widget build(BuildContext context) {
    ////
    ///
    ///
    ///
    ///
    ///
    ///
    ///

    fromController.text = 'Rocklands';
    toController.text = 'CUT';
    timeController.text = '12:30';
    busCodeController.text = 'Central Park';
    typeController.text = 'QR';
    recipientController.text = '0671231234';
    isUsedController.text = 'False';
    priceController.text = '95';

    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/PurchaseDetail.png',
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 44,
                        ),
                        Text(
                          'Purchase Details',
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 300,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: DropdownButton(
                      onChanged: (value) => setState(() {
                        this.value = value as String?;
                        if (value == 'Someone') {
                          buyForMe = false;
                        } else {
                          buyForMe = true;
                        }
                      }),
                      value: value,
                      items: receipients.map(buildMenuItem).toList(),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      iconSize: 20,
                      hint: Text('Choose recipient'),
                    ),
                  ),
                  SizedBox(height: 15),
                  reciver(buyForMe),
                  SizedBox(height: 15),
                  Container(
                    width: 300,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Amount',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[400],
                        fixedSize: Size(300, 60),
                      ),
                      onPressed: () {
                        UserService.userEmail =
                            context.read<UserService>().currentUser!.email;
                        createNewTicketInUI(
                          context,
                          fromController: fromController,
                          toController: toController,
                          timeController: timeController,
                          ownerController:
                              context.read<UserService>().currentUser!.email,
                          recipientController: recipientController,
                          typeController: typeController,
                          isUsedController: isUsedController,
                          priceController: priceController,
                        );
                        saveAllTicketsInUI(context);
                        /*Navigator.pushNamed(
                            context, RouteManager.paymentDetails);*/
                      },
                      child: Text('Pay'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget reciver(bool forWho) {
  Widget widget = Container();

  if (!forWho) {
    widget = Container(
      width: 300,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Recipient',
        ),
      ),
    );
  }

  return widget;
}
