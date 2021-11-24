import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/models/ticket.dart';
import 'package:interstate_bus_services_app/services/ticket_service.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
import 'package:provider/provider.dart';

void refreshTicketsInUI(BuildContext context) async {
  //TODO: Check when doing full tickets, update getTickets()
  String result = await context
      .read<TicketService>()
      .getTickets(context.read<UserService>().currentUser!.email);

  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Data Succefully Loaded!!!');
  }
}

void createNewTicketInUI(
  BuildContext context, {
  required TextEditingController fromController,
  required TextEditingController toController,
  required TextEditingController timeController,
  required TextEditingController typeController,
  required String ownerController,
  required TextEditingController recipientController,
  required TextEditingController isUsedController,
  required TextEditingController priceController,
}) async {
  if (fromController.text.isEmpty ||
      toController.text.isEmpty ||
      timeController.text.isEmpty ||
      typeController.text.isEmpty ||
      ownerController.isEmpty ||
      recipientController.text.isEmpty ||
      isUsedController.text.isEmpty ||
      priceController.text.isEmpty) {
    showSnackBar(context, 'Please Enter All Fields First!!');
  } else {
    Ticket ticket = Ticket(
      ticketOwner: ownerController,
      ticketRecipient: recipientController.text,
      from: fromController.text,
      to: toController.text,
      time: timeController.text,
      ticketType: typeController.text,
      isUsed: isUsedController.text,
      price: priceController.text,
    );
    context.read<TicketService>().createTicket(ticket);
    Navigator.pop(context);

    // Check for title duplicate
    /*if (context.read<TicketService>().tickets.contains(ticket)) {
      showSnackBar(context, 'Title Already Exist, Change Title');
    } else {
      context.read<TicketService>().createTicket(ticket);
      Navigator.pop(context);
    }*/
  }
}

void saveAllTicketsInUI(BuildContext context) async {
  String result = await context
      .read<TicketService>()
      .saveTicketEntry(context.read<UserService>().currentUser!.email, true);

  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Ticket Saved!!!');
  }
}
