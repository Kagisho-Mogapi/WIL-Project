import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/models/ticket.dart';
import 'package:interstate_bus_services_app/services/ticket_service.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
import 'package:provider/provider.dart';

void refreshTicketsInUI(BuildContext context) async {
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
  required String typeController,
  required String ownerController,
  required String isUsedController,
  required String priceController,
}) async {
  Ticket ticket = Ticket(
    ticketOwner: ownerController,
    ticketType: typeController,
    isUsed: isUsedController,
    price: priceController,
  );
  context.read<TicketService>().createTicket(ticket);
  Navigator.pop(context);
}

void createNewOtherTicketInUI(
  BuildContext context, {
  required String typeController,
  required String ownerController,
  required String isUsedController,
  required String priceController,
}) async {
  Ticket ticket = Ticket(
    ticketOwner: ownerController,
    ticketType: typeController,
    isUsed: isUsedController,
    price: priceController,
  );
  context.read<TicketService>().createOtherTicket(ticket);
  Navigator.pop(context);
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

void saveAllOtherTicketsInUI(BuildContext context, String otherUser) async {
  String result =
      await context.read<TicketService>().saveOtherTicketEntry(otherUser, true);

  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Ticket Saved!!!');
  }
}
