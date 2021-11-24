class Ticket {
  final String ticketOwner;
  final String ticketRecipient;
  final String from;
  final String to;
  //TODO: change to DAteTime
  final String time;
  final String ticketType;
  final String isUsed;
  final String price;

  Ticket(
      {required this.ticketOwner,
      required this.ticketRecipient,
      required this.from,
      required this.to,
      required this.time,
      required this.ticketType,
      required this.isUsed,
      required this.price});

  Map<String, Object?> toJson() => {
        'ticketOwner': ticketOwner,
        'ticketRecipient': ticketRecipient,
        'from': from,
        'to': to,
        'time': time,
        'ticketType': ticketType,
        'isUsed': isUsed,
        'price': price,
        //'done': done ? 1 : 0,
        //'created': created.millisecondsSinceEpoch,
      };

  static Ticket fromJson(Map<dynamic, dynamic>? json) => Ticket(
        ticketOwner: json!['ticketOwner'] as String,
        ticketRecipient: json['ticketRecipient'] as String,
        from: json['from'] as String,
        to: json['to'] as String,
        time: json['time'] as String,
        ticketType: json['ticketType'] as String,
        isUsed: json['isUsed'] as String,
        price: json['price'] as String,
      );
}

Map<dynamic, dynamic> convertTicketListToMap(List<Ticket> tickets) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < tickets.length; i++) {
    map.addAll({'$i': tickets[i].toJson()});
  }
  return map;
}

List<Ticket> convertMapToTicketList(Map<dynamic, dynamic> map) {
  List<Ticket> tickets = [];
  for (var i = 0; i < map.length; i++) {
    tickets.add(Ticket.fromJson(map['$i']));
  }
  return tickets;
}
