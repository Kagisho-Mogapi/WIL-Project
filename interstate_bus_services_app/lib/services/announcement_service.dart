import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:interstate_bus_services_app/Functions/user_role.dart';
import 'package:interstate_bus_services_app/models/announcement.dart';
import 'package:interstate_bus_services_app/models/announcement_entry.dart';

class AnnouncementService with ChangeNotifier {
  AnnouncementEntry? _announcementEntry;

  List<Announcement> _announcements = [];
  List<Announcement> get announcements => _announcements;

  // Level of announcement
  String levelEveryone = "level ='everyone'";
  String levelBusDriver = "level ='busDriver'";
  String levelAdmin = "level ='admin'";
  String level = '';
  static bool fromCreateAnnouncement = false;

  void emptyAnnouncements() {
    _announcements = [];
    notifyListeners();
  }

  bool _busyRetrieving = false;
  bool _busySaving = false;

  bool get busyRetrieving => _busyRetrieving;
  bool get busySaving => _busySaving;

  Future<String> getAnnouncements(String recipient) async {
    String result = 'OK';
    print(recipient);

    if (fromCreateAnnouncement) {
      if (recipient == 'Administrator') {
        level = levelAdmin;
      } else if (recipient == 'Bus Driver') {
        level = levelBusDriver;
      } else {
        level = levelEveryone;
      }
      fromCreateAnnouncement = false;
      print('We Heeeeeeeeerrrr');
    } else {
      if (UserRole.userRole == 'admin') {
        level = levelAdmin;
      } else if (UserRole.userRole == 'driver') {
        level = levelBusDriver;
      } else {
        level = levelEveryone;
      }
    }

    // Which level's Row
    DataQueryBuilder queryBuilder = DataQueryBuilder()..whereClause = level;
    print(level);

    _busyRetrieving = true;
    notifyListeners();

    // Get Data from table called 'AnnoucementEntry'
    List<Map<dynamic, dynamic>?>? map = await Backendless.data
        .of('AnnouncementEntry')
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
        //print(map[0]);
        _announcementEntry = AnnouncementEntry.fromJson(map.first);
        _announcements =
            convertMapToAnnouncementList(_announcementEntry!.announcements);
        notifyListeners();
      } else {
        emptyAnnouncements();
      }
    } else {
      result = 'NOT OK';
    }

    _busyRetrieving = false;
    notifyListeners();

    return result;
  }

  Future<String> saveAnnouncementEntry(String username, bool inUI) async {
    String result = 'OK';
    if (_announcementEntry == null) {
      _announcementEntry = AnnouncementEntry(
          announcements: convertAnnouncementListToMap(_announcements),
          username: username);
    } else {
      _announcementEntry!.announcements =
          convertAnnouncementListToMap(_announcements);
    }

    // Showing the busy progress
    if (inUI) {
      _busySaving = true;
      notifyListeners();
    }

    // Saving the Announcement to table
    await Backendless.data
        .of('AnnouncementEntry')
        .save(_announcementEntry!.toJson())
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

  /*void toggleAnnouncementDone(int index) {
    _announcements[index].done = !_announcements[index].done;
    notifyListeners();
  }*/

  void deleteAnnouncement(Announcement announcement) {
    _announcements.remove(announcement);
    notifyListeners();
  }

  void createAnnouncement(Announcement announcement) {
    _announcements.insert(0, announcement);
    notifyListeners();
  }
}
