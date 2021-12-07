import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Functions/refresh_user_details.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/ticket_service.dart';
import 'package:interstate_bus_services_app/services/helper_ticket.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/ticket_card.dart';
import 'package:provider/provider.dart' as provider;

class ViewMyBoughtTicket extends StatefulWidget {
  const ViewMyBoughtTicket({Key? key}) : super(key: key);

  @override
  _ViewMyBoughtTicketState createState() => _ViewMyBoughtTicketState();
}

class _ViewMyBoughtTicketState extends State<ViewMyBoughtTicket> {
  late TextEditingController ticketController;
  double differance = 0;

  @override
  void initState() {
    super.initState();
    ticketController = TextEditingController();
    // context
    //     .read<TicketService>()
    //     .getTickets(context.read<UserService>().currentUser!.email);
  }

  @override
  void dispose() {
    ticketController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
              icon: Icon(Icons.replay_outlined),
              tooltip: 'Refresh',
              onPressed: () {
                refreshTicketsInUI(context);
              }),
          SizedBox(width: 30),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(children: [
        SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Background2.jpg'),
                  ),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50)),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Purchase',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'History List',
                          style: TextStyle(
                              fontSize: 20, color: Colors.orange[800]),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Latest Purchases',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
                endIndent: 10,
                indent: 10,
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 20,
                    ),
                    child: provider.Consumer<TicketService>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          itemCount: value.tickets.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      //title: Text(value.tickets[index].to),
                                      content: Text('Ticket Owner: ${value.tickets[index].ticketOwner}\n' +
                                          'Amount: R${value.tickets[index].price}\n' +
                                          'Ticket Type: ${value.tickets[index].ticketType}\n' +
                                          'Is Used: ${value.tickets[index].isUsed}\n'),
                                      actions: [
                                        TextButton(
                                          child: Text('Repeat'),
                                          onPressed: () {
                                            double currentBalance =
                                                double.parse(context
                                                    .read<UserService>()
                                                    .currentUser!
                                                    .getProperty('credits'));
                                            if (currentBalance <
                                                double.parse(value
                                                    .tickets[index].price)) {
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    //title: Text(value.tickets[index].to),
                                                    content: Text(
                                                        'Current balance is low, balance is R$currentBalance'),
                                                    actions: [
                                                      TextButton(
                                                        child: Text('Topup'),
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              RouteManager
                                                                  .balanceDetails);
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text('Close'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
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
                                                  double.parse(value
                                                      .tickets[index].price);
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
                                              createNewTicketInUI(
                                                context,
                                                ownerController: context
                                                    .read<UserService>()
                                                    .currentUser!
                                                    .email,
                                                typeController: value
                                                    .tickets[index].ticketType,
                                                isUsedController:
                                                    value.tickets[index].isUsed,
                                                priceController:
                                                    value.tickets[index].price,
                                              );
                                              saveAllTicketsInUI(context);
                                              refreshUserDetails(context);
                                            }
                                            // UserService.userEmail = context
                                            //     .read<UserService>()
                                            //     .currentUser!
                                            //     .email;
                                            // createNewTicketInUI(
                                            //   context,
                                            //   ownerController: value
                                            //       .tickets[index].ticketOwner,
                                            //   typeController: value
                                            //       .tickets[index].ticketType,
                                            //   isUsedController:
                                            //       value.tickets[index].isUsed,
                                            //   priceController:
                                            //       value.tickets[index].price,
                                            // );
                                            // saveAllTicketsInUI(context);
                                            /*Navigator.pushNamed(
                            context, RouteManager.paymentDetails);*/
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Share'),
                                          onPressed: () {},
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
                              },
                              child: MyTicketCard(
                                message: value.tickets[index],
                                deletaAction: () async {
                                  context
                                      .read<TicketService>()
                                      .deleteTicket(value.tickets[index]);
                                },
                              ),
                            );
                          },
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
        provider.Selector<TicketService, bool>(
          selector: (context, value) => value.busyRetrieving,
          builder: (context, value, child) {
            return value
                ? AppProgressIndicator(
                    text: 'Retrieving data from the database... Please wait...')
                : Container();
          },
        )
      ]),
    );
  }
}

TextStyle myTextStyle() {
  return TextStyle(fontSize: 15, color: Colors.white);
}
