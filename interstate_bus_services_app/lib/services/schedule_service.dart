import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:interstate_bus_services_app/models/schedule.dart';
import 'package:interstate_bus_services_app/models/schedule_entry.dart';

class ScheduleService with ChangeNotifier {
  ScheduleEntry? _scheduleEntry;

  List<Schedule> _schedules = [];
  List<Schedule> get schedules => _schedules;

  void emptySchedules() {
    _schedules = [];
    notifyListeners();
  }

  bool _busyRetrieving = false;
  bool _busySaving = false;

  bool get busyRetrieving => _busyRetrieving;
  bool get busySaving => _busySaving;

  Future<String> getSchedules(String username) async {
    String result = 'OK';

    // Which username's Row
    DataQueryBuilder queryBuilder = DataQueryBuilder()
      ..whereClause = "show ='YES'";

    _busyRetrieving = true;
    notifyListeners();

    // Get Data from table called 'AnnoucementEntry'
    List<Map<dynamic, dynamic>?>? map = await Backendless.data
        .of('ScheduleEntry')
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
        _scheduleEntry = ScheduleEntry.fromJson(map.first);
        _schedules = convertMapToScheduleList(_scheduleEntry!.schedules);
        notifyListeners();
      } else {
        emptySchedules();
      }
    } else {
      result = 'NOT OK';
    }

    _busyRetrieving = false;
    notifyListeners();

    return result;
  }

  Future<String> saveScheduleEntry(String username, bool inUI) async {
    String result = 'OK';
    if (_scheduleEntry == null) {
      _scheduleEntry = ScheduleEntry(
          schedules: convertScheduleListToMap(_schedules), username: username);
    } else {
      _scheduleEntry!.schedules = convertScheduleListToMap(_schedules);
    }

    // Showing the busy progress
    if (inUI) {
      _busySaving = true;
      notifyListeners();
    }

    // Saving the Schedule to table
    await Backendless.data
        .of('ScheduleEntry')
        .save(_scheduleEntry!.toJson())
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

  /*void toggleScheduleDone(int index) {
    _schedules[index].done = !_schedules[index].done;
    notifyListeners();
  }*/

  void deleteSchedule(Schedule schedule) {
    _schedules.remove(schedule);
    notifyListeners();
  }

  void createSchedule(Schedule schedule) {
    _schedules.insert(0, schedule);
    notifyListeners();
  }
}
