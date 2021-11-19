class Schedule {
  final String from;
  final String to;
  //TODO: change to DAteTime
  final String time;
  final String busCode;
  // Done is from example that task has been complete
  //bool done;
  //final DateTime created;

  Schedule({
    required this.from,
    required this.to,
    required this.time,
    required this.busCode,
    //this.done = false,
    //required this.created,
  });

  Map<String, Object?> toJson() => {
        'from': from,
        'to': to,
        'time': time,
        'busCode': busCode,
        //'done': done ? 1 : 0,
        //'created': created.millisecondsSinceEpoch,
      };

  static Schedule fromJson(Map<dynamic, dynamic>? json) => Schedule(
        from: json!['from'] as String,
        to: json['to'] as String,
        time: json['time'] as String,
        busCode: json['busCode'] as String,
      );

  // Checks for from duplicates
  /*@override
  bool operator ==(covariant Schedule schedule) {
    return (this
            .from
            .toUpperCase()
            .compareTo(schedule.from.toUpperCase()) ==
        0);
  }

  @override
  int get hashCode {
    return from.hashCode;
  }*/
}

Map<dynamic, dynamic> convertScheduleListToMap(List<Schedule> schedules) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < schedules.length; i++) {
    map.addAll({'$i': schedules[i].toJson()});
  }
  return map;
}

List<Schedule> convertMapToScheduleList(Map<dynamic, dynamic> map) {
  List<Schedule> schedules = [];
  for (var i = 0; i < map.length; i++) {
    schedules.add(Schedule.fromJson(map['$i']));
  }
  return schedules;
}
