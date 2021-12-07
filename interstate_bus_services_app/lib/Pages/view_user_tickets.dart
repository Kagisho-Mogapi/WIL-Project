import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/ticket_service.dart';
import 'package:interstate_bus_services_app/services/helper_ticket.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/ticket_card.dart';
import 'package:provider/provider.dart' as provider;

class ViewUserTickets extends StatefulWidget {
  const ViewUserTickets({Key? key}) : super(key: key);

  @override
  _ViewUserTicketsState createState() => _ViewUserTicketsState();
}

class _ViewUserTicketsState extends State<ViewUserTickets> {
  TextEditingController findController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'View My Tickets',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Interstatelogo.jpg',
                      alignment: Alignment.center,
                      width: 394,
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
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  color: Colors.grey[100],
                  child: ListTile(
                    title: TextField(
                      controller: findController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    // OpenTextField(
                    //     hint: 'User email',
                    //     regExp: MyRegexes.email,
                    //     controller: findController,
                    //     isPass: false,
                    //     isValidInput: true,
                    //     errorMsg: 'errorMsg'),
                    trailing: Container(
                      // color: Colors.grey[300],
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          context
                              .read<TicketService>()
                              .getTickets(findController.text.trim());
                        },
                      ),
                    ),
                  ),
                ),
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
