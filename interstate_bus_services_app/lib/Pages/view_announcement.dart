import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Functions/user_role.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/announcement_service.dart';
import 'package:interstate_bus_services_app/services/helper_announcement.dart';
import 'package:interstate_bus_services_app/widgets/announcement_card.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:provider/provider.dart' as provider;

class ViewAnnouncement extends StatefulWidget {
  const ViewAnnouncement({Key? key}) : super(key: key);

  @override
  _ViewAnnouncementState createState() => _ViewAnnouncementState();
}

class _ViewAnnouncementState extends State<ViewAnnouncement> {
  @override
  void initState() {
    super.initState();
    // context.read<AnnouncementService>().getAnnouncements('');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('View Announcements'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
              icon: Icon(Icons.replay_outlined),
              tooltip: 'Refresh',
              onPressed: () {
                refreshAnnouncementsInUI(context);
              }),
          SizedBox(width: 10),
          UserRole.userRole == 'admin' ? adminWidgets(context) : Container()
        ],
      ),
      backgroundColor: Colors.orangeAccent,
      body: Stack(children: [
        // Container(
        //   constraints: BoxConstraints.expand(),
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/images/Background1.jpg'),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        // Opacity(
        //   opacity: 0.85,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: Alignment.topCenter,
        //           end: Alignment.bottomCenter,
        //           colors: [Colors.red, Colors.blue]),
        //     ),
        //   ),
        // ),
        Container(
          height: MediaQuery.of(context).size.height - 82.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
        ),

        Positioned(
            top: 40.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0),
                ),
                // image: DecorationImage(
                //     image: AssetImage('assets/images/BusLines.png'),
                //     fit: BoxFit.fill),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height - 120.0,
              width: MediaQuery.of(context).size.width,
            )),
        SafeArea(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text(
              //         'View Announcement',
              //         style: TextStyle(
              //           fontSize: 22,
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 32,
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
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      title: Text(
                                          value.announcements[index].title),
                                      content: Text(value
                                          .announcements[index].description),
                                      actions: [
                                        TextButton(
                                          child: Text('Close'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: AnnouncementCard(
                                message: value.announcements[index],
                                deletaAction: () async {
                                  context
                                      .read<AnnouncementService>()
                                      .deleteAnnouncement(
                                          value.announcements[index]);
                                },
                              ),
                            );
                          },
                        );
                      },
                    )),
              ),
              /*ElevatedButton(
                  child: Text(
                    'Refresh',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    refreshAnnouncementsInUI(context);
                  },
                ),*/
              /*SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Save Changes'),
                  onPressed: () {
                    saveAllAnnouncementsInUI(context);
                  },
                ),*/
              /*SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Write Announcement'),
                  onPressed: () {
                    saveAllAnnouncementsInUI(context);
                    Navigator.pushNamed(
                        context, RouteManager.writeAnnouncements);
                  },
                ),*/
            ],
          ),
        ),
        provider.Selector<AnnouncementService, bool>(
          selector: (context, value) => value.busyRetrieving,
          builder: (context, value, child) {
            return value
                ? AppProgressIndicator(
                    text: 'Retrieving data from the database... Please wait...')
                : Container();
          },
        )
      ]),
    );
  }
}

Container adminWidgets(BuildContext context) {
  return Container(
    child: Row(
      children: [
        IconButton(
            icon: Icon(Icons.system_update_tv_sharp),
            tooltip: 'Save',
            onPressed: () {
              saveAllAnnouncementsInUI(context, UserRole.userRole);
            }),
        SizedBox(width: 10),
        IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Write Announcement',
            onPressed: () {
              Navigator.pushNamed(context, RouteManager.writeAnnouncements);
            }),
        SizedBox(width: 20),
      ],
    ),
  );
}
