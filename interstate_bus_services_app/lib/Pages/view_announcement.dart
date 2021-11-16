import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/announcement_service.dart';
import 'package:interstate_bus_services_app/services/helper_announcement.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/announcement_card.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:provider/provider.dart' as provider;
import 'package:tuple/tuple.dart';

class ViewAnnouncement extends StatefulWidget {
  const ViewAnnouncement({Key? key}) : super(key: key);

  @override
  _ViewAnnouncementState createState() => _ViewAnnouncementState();
}

class _ViewAnnouncementState extends State<ViewAnnouncement> {
  late TextEditingController announcementController;

  @override
  void initState() {
    super.initState();
    /*context
        .read<AnnouncementService>()
        .getAnnouncements(context.read<UserService>().currentUser!.email);*/
    announcementController = TextEditingController();
  }

  @override
  void dispose() {
    announcementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Stack(children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'View Announcement',
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
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 20,
                      ),
                      child: provider.Consumer<AnnouncementService>(
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.announcements.length,
                            itemBuilder: (context, index) {
                              return AnnouncementCard(
                                message: value.announcements[index],
                                deletaAction: () async {
                                  context
                                      .read<AnnouncementService>()
                                      .deleteAnnouncement(
                                          value.announcements[index]);
                                },
                              );
                            },
                          );
                        },
                      )),
                ),
                ElevatedButton(
                  child: Text('Refresh'),
                  onPressed: () {
                    refreshAnnouncementsInUI(context);
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Save Changes'),
                  onPressed: () {
                    saveAllAnnouncementsInUI(context);
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Write Announcement'),
                  onPressed: () {
                    saveAllAnnouncementsInUI(context);
                    Navigator.pushNamed(
                        context, RouteManager.writeAnnouncements);
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          provider.Selector<AnnouncementService, bool>(
            selector: (context, value) => value.busyRetrieving,
            builder: (context, value, child) {
              return value
                  ? AppProgressIndicator(
                      text:
                          'Retrieving data from the database... Please wait...')
                  : Container();
            },
          )
        ]),
      ),
    );
  }
}
