import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Functions/refresh_user_details.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/helper_ticket.dart';
import 'package:interstate_bus_services_app/services/ticket_service.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/regexes.dart';
import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
import 'package:provider/provider.dart';

class BuyForUser extends StatefulWidget {
  const BuyForUser({Key? key}) : super(key: key);

  @override
  _BuyForUserState createState() => _BuyForUserState();
}

class _BuyForUserState extends State<BuyForUser> {
  bool buyForMe = true;
  TextEditingController typeController = TextEditingController();
  TextEditingController isUsedController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController recipientController = TextEditingController();

  @override
  void dispose() {
    typeController.dispose();
    isUsedController.dispose();
    priceController.dispose();

    super.dispose();
  }

  final List<String> receipients = [
    'Me',
    'Someone',
  ];

  final List<String> ticketTypeOption = [
    'QR Code',
    'Tag',
  ];

  final List<String> locations = [
    'Thaba Nchu',
    'Botshabelo',
    'Bloemfontein',
    'Botshabelo',
  ];

  String? value;
  String? recipient;
  double differance = 0;
  bool isAmountValid = true;

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

    isUsedController.text = 'False';

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
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Center(
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
                          typeController.text = this.value!;
                        }),
                        value: value,
                        items: ticketTypeOption.map(buildMenuItem).toList(),
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        iconSize: 20,
                        hint: Text('Choose ticket type'),
                      ),
                    ),
                    SizedBox(height: 15),
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
                          this.recipient = value as String?;
                          if (value == 'Someone') {
                            buyForMe = false;
                          } else {
                            buyForMe = true;
                          }
                        }),
                        value: recipient,
                        items: receipients.map(buildMenuItem).toList(),
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        iconSize: 20,
                        hint: Text('Choose recipient'),
                      ),
                    ),
                    SizedBox(height: 15),
                    !buyForMe
                        ? Container(
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
                              controller: recipientController,
                              decoration: InputDecoration(
                                hintText: 'Recipient',
                              ),
                            ),
                          )
                        : Container(),

                    // reciver(buyForMe),
                    SizedBox(height: 15),
                    Focus(
                      onFocusChange: (value) {
                        if (priceController.text.trim().isEmpty) {
                          isAmountValid = true;
                        } else {
                          isAmountValid = myInputValidation(
                              priceController.text.trim(), MyRegexes.number);
                        }
                      },
                      child: Container(
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
                          keyboardType: TextInputType.number,
                          controller: priceController,
                          decoration: InputDecoration(
                            errorText: isAmountValid ? null : 'Number only!!!',
                            hintText: 'Enter Amount',
                          ),
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
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          double currentBalance = double.parse(context
                              .read<UserService>()
                              .currentUser!
                              .getProperty('credits'));
                          if (priceController.text.trim().isEmpty ||
                              typeController.text.trim().isEmpty) {
                            showSnackBar(
                                context, 'Please Enter All Fields First');
                          } else {
                            if (!isAmountValid) {
                              showSnackBar(
                                  context, 'Amount should only be numbers');
                            } else if (currentBalance <
                                double.parse(priceController.text.trim())) {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    //title: Text(value.tickets[index].to),
                                    content: Text(
                                        'Current balance is low, balance is R$currentBalance'),
                                    actions: [
                                      TextButton(
                                        child: Text('Topup'),
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              RouteManager.balanceDetails);
                                        },
                                      ),
                                      TextButton(
                                        child: Text('Close'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              // double currentCredits = double.parse(context
                              //     .read<UserService>()
                              //     .currentUser!
                              //     .getProperty('credits'));
                              differance = currentBalance -
                                  double.parse(priceController.text.trim());
                              // UserService.subtractAmount =
                              //     );
                              UserService().subtractBalance(
                                  context
                                      .read<UserService>()
                                      .currentUser!
                                      .email,
                                  differance);
                              UserService.userEmail = context
                                  .read<UserService>()
                                  .currentUser!
                                  .email;

                              if (!buyForMe) {
                                context
                                    .read<TicketService>()
                                    .getOtherTickets(recipientController.text);

                                await Future.delayed(Duration(seconds: 2));
                                createNewOtherTicketInUI(
                                  context,
                                  ownerController: context
                                      .read<UserService>()
                                      .currentUser!
                                      .email,
                                  typeController: typeController.text.trim(),
                                  isUsedController:
                                      isUsedController.text.trim(),
                                  priceController: priceController.text.trim(),
                                );
                                saveAllOtherTicketsInUI(
                                    context, recipientController.text);
                              } else {
                                createNewTicketInUI(
                                  context,
                                  ownerController: context
                                      .read<UserService>()
                                      .currentUser!
                                      .email,
                                  typeController: typeController.text.trim(),
                                  isUsedController:
                                      isUsedController.text.trim(),
                                  priceController: priceController.text.trim(),
                                );
                                saveAllTicketsInUI(context);
                              }
                              refreshUserDetails(context);
                            }
                          }
                          /*Navigator.pushNamed(
                              context, RouteManager.paymentDetails);*/
                        },
                        child: Text('Pay'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

bool myInputValidation(String input, String regexe) {
  bool isValid = false;

  if (!RegExp(regexe).hasMatch(input)) {
    isValid = false;
  } else {
    isValid = true;
  }

  return isValid;
}

Widget reciver(bool forMe) {
  Widget widget = Container();

  if (!forMe) {
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
