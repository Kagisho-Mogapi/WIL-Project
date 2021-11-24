import 'dart:js';

import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:interstate_bus_services_app/models/ticket.dart';
import 'package:interstate_bus_services_app/models/ticket_entry.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:provider/provider.dart';

class TicketService with ChangeNotifier {
  //TODO: Change user reg. to ann. entry
  TicketEntry? _ticketEntry;

  List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  void emptyTickets() {
    _tickets = [];
    notifyListeners();
  }

  bool _busyRetrieving = false;
  bool _busySaving = false;

  bool get busyRetrieving => _busyRetrieving;
  bool get busySaving => _busySaving;

  Future<String> getTickets(String username) async {
    String result = 'OK';
    username = UserService.userEmail;

    // Which username's Row
    DataQueryBuilder queryBuilder = DataQueryBuilder()
      ..whereClause = "username ='$username'";

    _busyRetrieving = true;
    notifyListeners();

    // Get Data from table called 'AnnoucementEntry'
    List<Map<dynamic, dynamic>?>? map = await Backendless.data
        .of('TicketEntry')
        .find(queryBuilder)
        .onError((error, stackTrace) {
      result = error.toString();
    });

    // if theres an error it will stop here
    if (result != 'OK') {
      _busyRetrieving = false;
      notifyListeners();
      return result;
    }

    if (map != null) {
      if (map.length > 0) {
        // !!!! {map.first} because there's only one list per user !!!!!!!!!
        _ticketEntry = TicketEntry.fromJson(map.first);
        _tickets = convertMapToTicketList(_ticketEntry!.tickets);
        notifyListeners();
      } else {
        emptyTickets();
      }
    } else {
      result = 'NOT OK';
    }

    _busyRetrieving = false;
    notifyListeners();

    return result;
  }

  Future<String> saveTicketEntry(String username, bool inUI) async {
    String result = 'OK';
    if (_ticketEntry == null) {
      _ticketEntry = TicketEntry(
          tickets: convertTicketListToMap(_tickets), username: username);
    } else {
      _ticketEntry!.tickets = convertTicketListToMap(_tickets);
    }

    // Showing the busy progress
    if (inUI) {
      _busySaving = true;
      notifyListeners();
    }

    // Saving the Ticket to table
    await Backendless.data
        .of('TicketEntry')
        .save(_ticketEntry!.toJson())
        .onError((error, stackTrace) {
      result = error.toString();
    });

    // Closing the busy progress
    if (inUI) {
      _busySaving = false;
      notifyListeners();
    }
    return result;
  }

  // if task is done

  /*void toggleTicketDone(int index) {
    _tickets[index].done = !_tickets[index].done;
    notifyListeners();
  }*/

  void deleteTicket(Ticket ticket) {
    _tickets.remove(ticket);
    notifyListeners();
  }

  void createTicket(Ticket ticket) {
    _tickets.insert(0, ticket);
    notifyListeners();
  }
}
