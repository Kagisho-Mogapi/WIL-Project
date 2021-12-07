// import 'package:flutter/material.dart';
// import 'package:interstate_bus_services_app/services/helper_ticket.dart';
// import 'package:interstate_bus_services_app/services/user_service.dart';
// import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
// import 'package:provider/provider.dart';

// class BuyForUserOG extends StatefulWidget {
//   const BuyForUserOG({Key? key}) : super(key: key);

//   @override
//   _BuyForUserOGState createState() => _BuyForUserOGState();
// }

// class _BuyForUserOGState extends State<BuyForUserOG> {
//   bool buyForMe = true;
//   TextEditingController toController = TextEditingController();
//   TextEditingController fromController = TextEditingController();
//   TextEditingController timeController = TextEditingController();
//   TextEditingController busCodeController = TextEditingController();
//   TextEditingController typeController = TextEditingController();
//   TextEditingController recipientController = TextEditingController();
//   TextEditingController isUsedController = TextEditingController();
//   TextEditingController priceController = TextEditingController();

//   @override
//   void dispose() {
//     toController.dispose();
//     fromController.dispose();
//     timeController.dispose();
//     busCodeController.dispose();
//     typeController.dispose();
//     recipientController.dispose();
//     isUsedController.dispose();
//     priceController.dispose();

//     super.dispose();
//   }

//   final List<String> period = [
//     'Peak',
//     'Off-Peak',
//   ];

//   final List<String> ticketType = [
//     'QR Code',
//     'Tag',
//   ];

//   final List<String> locations = [
//     'Botshabelo',
//     'Bloemfontein',
//     'Suburbs',
//     'Thaba Nchu',
//     'Central Park',
//   ];

//   String? periodValue;
//   String? ticketTypeValue;
//   int ticketCost = 0;

//   String? fromValue;
//   String? toValue;
//   String radioButtonItem = 'Mondays to Fridays';
//   String areaItem = 'Botshabelo';
//   int fromID = 1;
//   int fromArea = 1;
//   int toID = 1;
//   int toArea = 1;

//   DropdownMenuItem<String> buildMenuItem(String admin) => DropdownMenuItem(
//       value: admin,
//       child: Text(
//         admin,
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//       ));

//   @override
//   Widget build(BuildContext context) {
//     ////
//     ///
//     ///
//     ///
//     ///
//     ///
//     ///
//     ///

//     //fromController.text = 'Rocklands';
//     //toController.text = 'CUT';
//     timeController.text = '12:30';
//     busCodeController.text = 'Central Park';
//     //typeController.text = 'QR';
//     recipientController.text = '0671231234';
//     isUsedController.text = 'False';
//     //priceController.text = '95';

//     ///
//     ///
//     ///
//     ///
//     ///
//     ///
//     ///
//     ///
//     ///
//     ///
//     ///
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.redAccent,
//         elevation: 0,
//       ),
//       backgroundColor: Colors.grey[200],
//       body: Stack(
//         children: [
//           // Container(
//           //   constraints: BoxConstraints.expand(),
//           //   decoration: BoxDecoration(
//           //     image: DecorationImage(
//           //       image: AssetImage('assets/images/Background1.jpg'),
//           //       fit: BoxFit.cover,
//           //     ),
//           //   ),
//           // ),
//           // Opacity(
//           //   opacity: 0.85,
//           //   child: Container(
//           //     decoration: BoxDecoration(
//           //       gradient: LinearGradient(
//           //           begin: Alignment.topCenter,
//           //           end: Alignment.bottomCenter,
//           //           colors: [Colors.red, Colors.blue]),
//           //     ),
//           //   ),
//           // ),
//           Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   /*Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       'assets/images/PurchaseDetail.png',
//                       alignment: Alignment.center,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 44,
//                         ),
//                         Text(
//                           'Purchase Details',
//                           style: TextStyle(fontSize: 22, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),

//                   Divider(height: 15, thickness: 5),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         'From Area',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Radio(
//                           value: 1,
//                           groupValue: fromArea,
//                           onChanged: (val) {
//                             setState(() {
//                               areaItem = 'Botshabelo';
//                               fromArea = 1;
//                               // this.fromValue = null;
//                             });
//                           },
//                         ),
//                         Text('Botshabelo'),
//                         Radio(
//                           value: 2,
//                           groupValue: fromArea,
//                           onChanged: (val) {
//                             setState(() {
//                               areaItem = 'Mangaung';
//                               fromArea = 2;
//                               // this.fromValue = null;
//                             });
//                           },
//                         ),
//                         Text('Mangaung'),
//                         Radio(
//                           value: 3,
//                           groupValue: fromArea,
//                           onChanged: (val) {
//                             setState(() {
//                               areaItem = 'Suburbs';
//                               fromArea = 3;
//                               // this.fromValue = null;
//                             });
//                           },
//                         ),
//                         Text('Suburbs'),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Radio(
//                           value: 4,
//                           groupValue: fromArea,
//                           onChanged: (val) {
//                             setState(() {
//                               areaItem = 'Thaba Nchu';
//                               fromArea = 4;

//                               // this.fromValue = null;
//                             });
//                           },
//                         ),
//                         Text('Thaba Nchu'),
//                         Radio(
//                           value: 5,
//                           groupValue: fromArea,
//                           onChanged: (val) {
//                             setState(() {
//                               areaItem = 'Central Park';
//                               fromArea = 5;

//                               // this.fromValue = null;
//                             });
//                           },
//                         ),
//                         Text('Central Park'),
//                         // Radio(
//                         //   value: 5,
//                         //   groupValue: area,
//                         //   onChanged: (val) {
//                         //     setState(() {
//                         //       areaItem = 'Other';
//                         //       area = 5;
//                         //     });
//                         //   },
//                         // ),
//                         // Text('Other'),
//                       ],
//                     ),
//                   ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.start,
//                   //   children: [
//                   //     SizedBox(
//                   //       width: 20,
//                   //     ),
//                   //     Text(
//                   //       'From Route',
//                   //       style: TextStyle(
//                   //         fontSize: 20,
//                   //         color: Colors.black,
//                   //         fontWeight: FontWeight.bold,
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),

//                   Divider(height: 15, thickness: 5),
//                   SizedBox(height: 10),

//                   ///
//                   ///
//                   ///
//                   ///
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         'To Area',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Radio(
//                           value: 1,
//                           groupValue: toArea,
//                           onChanged: (val) {
//                             setState(() {
//                               areaItem = 'Botshabelo';
//                               toArea = 1;
//                               // this.toValue = null;
//                             });
//                           },
//                         ),
//                         Text('Botshabelo'),
//                         Radio(
//                           value: 2,
//                           groupValue: toArea,
//                           onChanged: (val) {
//                             setState(() {
//                               areaItem = 'Mangaung';
//                               toArea = 2;
//                               // this.toValue = null;
//                             });
//                           },
//                         ),
//                         Text('Mangaung'),
//                         Radio(
//                           value: 3,
//                           groupValue: toArea,
//                           onChanged: (val) {
//                             setState(() {
//                               areaItem = 'Suburbs';
//                               toArea = 3;
//                               // this.toValue = null;
//                             });
//                           },
//                         ),
//                         Text('Suburbs'),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Radio(
//                           value: 4,
//                           groupValue: toArea,
//                           onChanged: (val) {
//                             setState(() {
//                               areaItem = 'Thaba Nchu';
//                               toArea = 4;

//                               // this.toValue = null;
//                             });
//                           },
//                         ),
//                         Text('Thaba Nchu'),
//                         Radio(
//                           value: 5,
//                           groupValue: toArea,
//                           onChanged: (val) {
//                             setState(() {
//                               areaItem = 'Central Park';
//                               toArea = 5;

//                               // this.toValue = null;
//                             });
//                           },
//                         ),
//                         Text('Central Park'),
//                         // Radio(
//                         //   value: 5,
//                         //   groupValue: area,
//                         //   onChanged: (val) {
//                         //     setState(() {
//                         //       areaItem = 'Other';
//                         //       area = 5;
//                         //     });
//                         //   },
//                         // ),
//                         // Text('Other'),
//                       ],
//                     ),
//                   ),*/
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.start,
//                   //   children: [
//                   //     SizedBox(
//                   //       width: 20,
//                   //     ),
//                   //     Text(
//                   //       'To Route',
//                   //       style: TextStyle(
//                   //         fontSize: 20,
//                   //         color: Colors.black,
//                   //         fontWeight: FontWeight.bold,
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   Container(
//                     width: 300,
//                     margin: EdgeInsets.all(8),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 2,
//                       ),
//                     ),
//                     child: DropdownButton(
//                       onChanged: (value) => setState(() {
//                         this.periodValue = value as String?;

//                         // from Local to Local
//                         if (fromArea == toArea) {
//                           ticketCost = 11;
//                         }
//                         //TODO: ask if interchangable
//                         // from Bots to Mangaung or from Mangaung to Bots
//                         else if (fromArea == 1 && toArea == 2 ||
//                             fromArea == 2 && toArea == 1) {
//                           if (periodValue == 'Off-Peak') {
//                             ticketCost = 21;
//                           } else {
//                             ticketCost = 32;
//                           }
//                         } else if (fromArea == 1 && toArea == 2 ||
//                             fromArea == 2 && toArea == 1) {
//                           if (periodValue == 'Off-Peak') {
//                             ticketCost = 21;
//                           } else {
//                             ticketCost = 32;
//                           }
//                         }

//                         // if (value == 'Someone') {
//                         //   buyForMe = false;
//                         // } else {
//                         //   buyForMe = true;
//                         // }
//                       }),
//                       value: periodValue,
//                       items: period.map(buildMenuItem).toList(),
//                       icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                       iconSize: 20,
//                       hint: Text('Choose period'),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     width: 300,
//                     margin: EdgeInsets.all(8),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 2,
//                       ),
//                     ),
//                     child: DropdownButton(
//                       onChanged: (value) => setState(() {
//                         this.ticketTypeValue = value as String?;
//                       }),
//                       value: ticketTypeValue,
//                       items: ticketType.map(buildMenuItem).toList(),
//                       icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                       iconSize: 20,
//                       hint: Text('Choose ticket type'),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   reciver(buyForMe),
//                   SizedBox(height: 15),
//                   Container(
//                       width: 300,
//                       padding: EdgeInsets.all(8.0),
//                       // decoration: BoxDecoration(
//                       //   color: Colors.grey[200],
//                       //   border: Border.all(
//                       //     color: Colors.black,
//                       //     width: 2,
//                       //   ),
//                       // ),
//                       child: Text('Ticket cost: R$ticketCost')
//                       // TextField(
//                       //   decoration: InputDecoration(
//                       //     hintText: 'Enter Amount',
//                       //   ),
//                       // ),
//                       ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.red[400],
//                         fixedSize: Size(300, 60),
//                       ),
//                       onPressed: () {
//                         if (timeController.text.trim().isEmpty ||
//                             ticketTypeValue == null ||
//                             periodValue == null) {
//                           showSnackBar(
//                               context, 'Please Enter All Fields First!!');
//                         } else {
//                           UserService.userEmail =
//                               context.read<UserService>().currentUser!.email;
//                           createNewTicketInUI(
//                             context,
//                             fromController: locations[1 + fromArea],
//                             toController: locations[1 + toArea],
//                             timeController: timeController.text.trim(),
//                             ownerController:
//                                 context.read<UserService>().currentUser!.email,
//                             recipientController:
//                                 recipientController.text.trim(),
//                             typeController: ticketTypeValue!,
//                             isUsedController: isUsedController.text.trim(),
//                             priceController: ticketCost.toString(),
//                           );
//                           saveAllTicketsInUI(context);
//                         }
//                         /*Navigator.pushNamed(
//                             context, RouteManager.paymentDetails);*/
//                       },
//                       child: Text(
//                         'Buy',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// Widget reciver(bool forWho) {
//   Widget widget = Container();

//   if (!forWho) {
//     widget = Container(
//       width: 300,
//       padding: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         border: Border.all(
//           color: Colors.black,
//           width: 2,
//         ),
//       ),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: 'Recipient',
//         ),
//       ),
//     );
//   }

//   return widget;
// }
