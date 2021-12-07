class Ticket {
  final String ticketOwner;
  final String ticketType;
  final String isUsed;
  final String price;

  Ticket(
      {required this.ticketOwner,
      required this.ticketType,
      required this.isUsed,
      required this.price});

  Map<String, Object?> toJson() => {
        'ticketOwner': ticketOwner,
        'ticketType': ticketType,
        'isUsed': isUsed,
        'price': price,
        //'done': done ? 1 : 0,
        //'created': created.millisecondsSinceEpoch,
      };

  static Ticket fromJson(Map<dynamic, dynamic>? json) => Ticket(
        ticketOwner: json!['ticketOwner'] as String,
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
