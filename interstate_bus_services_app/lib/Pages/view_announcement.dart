import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/widgets/announcement_card.dart';

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
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return AnnouncementCard(
                            messageToggleAction: (value) async {},
                            deletaAction: () async {},
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
