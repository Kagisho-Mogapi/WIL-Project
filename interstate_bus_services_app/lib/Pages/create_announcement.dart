import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/announcement_service.dart';
import 'package:interstate_bus_services_app/services/helper_announcement.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
import 'package:provider/provider.dart' as provider;

class CreateAnnouncement extends StatefulWidget {
  const CreateAnnouncement({Key? key}) : super(key: key);

  @override
  _CreateAnnouncementState createState() => _CreateAnnouncementState();
}

class _CreateAnnouncementState extends State<CreateAnnouncement> {
  late TextEditingController titleController;
  late TextEditingController announcementController;

  final List<String> administrators = [
    'Administrator',
    'Bus Driver',
    'Commuter',
  ];

  String? recipient;
  DropdownMenuItem<String> buildMenuItem(String admin) => DropdownMenuItem(
      value: admin,
      child: Text(
        admin,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ));

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    announcementController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    announcementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Create announcement'),
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.orangeAccent,
      body: Stack(
        children: <Widget>[
          //
          Container(
            height: MediaQuery.of(context).size.height - 82.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
          Positioned(
              top: 80.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  ),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height - 120.0,
                width: MediaQuery.of(context).size.width,
              )),
          SafeArea(
            //child: Container(
            //height: 1000,
            //width: 1000,
            //decoration: waterDeepDeco(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Create Announcement',
                  //         style: TextStyle(
                  //           fontSize: 22,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                  Divider(
                    height: 15,
                    thickness: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Announcement',
                          style: TextStyle(
                            fontSize: 18,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: DropdownButton(
                            onChanged: (value) => setState(
                                () => this.recipient = value as String),
                            value: recipient,
                            items: administrators.map(buildMenuItem).toList(),
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            iconSize: 20,
                            hint: Text('Choose recipient'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Focus(
                            onFocusChange: (value) {
                              if (!value) {
                                AnnouncementService.fromCreateAnnouncement =
                                    true;
                                context
                                    .read<AnnouncementService>()
                                    .getAnnouncements(recipient!);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.only(bottom: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: TextField(
                                controller: titleController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: '  Write Announcement title',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: TextField(
                              controller: announcementController,
                              maxLines: 8,
                              decoration: InputDecoration(
                                hintText: '  Write Announcement Description',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Text(
                          'Upload',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      onPressed: () {
                        if (recipient == null ||
                            announcementController.text.trim().isEmpty ||
                            titleController.text.trim().isEmpty) {
                          showSnackBar(context, 'Please Enter All Fields');
                        } else {
                          // Are they both needed?
                          context
                              .read<AnnouncementService>()
                              .getAnnouncements(recipient!);
                          createNewAnnouncementInUI(context,
                              titleController: titleController,
                              descriptionController: announcementController,
                              recepientController: recipient!);
                          saveAllAnnouncementsInUI(context, recipient!);
                        }
                      },
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900]),
                        fixedSize:
                            MaterialStateProperty.all(Size.fromWidth(220)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          provider.Selector<AnnouncementService, bool>(
            selector: (context, value) => value.busySaving,
            builder: (context, value, child) {
              return value
                  ? AppProgressIndicator(
                      text: 'Saving data To the database... Please wait...')
                  : Container();
            },
          )
        ],
      ),
    );
  }
}
