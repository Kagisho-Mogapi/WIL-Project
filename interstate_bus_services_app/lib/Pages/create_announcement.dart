import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/announcement_service.dart';
import 'package:interstate_bus_services_app/services/helper_announcement.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/water_deep_deco.dart';
import 'package:provider/provider.dart' as provider;

class CreateAnnouncement extends StatefulWidget {
  const CreateAnnouncement({Key? key}) : super(key: key);

  @override
  _CreateAnnouncementState createState() => _CreateAnnouncementState();
}

class _CreateAnnouncementState extends State<CreateAnnouncement> {
  late TextEditingController announcementController;

  final List<String> administrators = [
    'Administrators',
    'Bus Drivers',
    'Everyone',
  ];

  String? value;
  DropdownMenuItem<String> buildMenuItem(String admin) => DropdownMenuItem(
      value: admin,
      child: Text(
        admin,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ));

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Background1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Opacity(
            opacity: 0.85,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.red, Colors.blue]),
              ),
            ),
          ),
          SafeArea(
            //child: Container(
              //height: 1000,
              //width: 1000,
              //decoration: waterDeepDeco(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Create Announcement',
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
                              onChanged: (value) =>
                                  setState(() => this.value = value as String?),
                              value: value,
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
                                  hintText: 'Type Announcement',
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
                          // Are they both needed?
                          createNewAnnouncementInUI(context,
                              titleController: announcementController);
                          saveAllAnnouncementsInUI(context);
                        },
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[900]),
                          fixedSize:
                              MaterialStateProperty.all(Size.fromWidth(220)),
                        ),
                      ),
                      /*MaterialButton(
                        height: 50,
                        minWidth: 200,
                        color: Colors.red[700],
                        onPressed: () {
                          // Are they both needed?
                          createNewAnnouncementInUI(context,
                              titleController: announcementController);
                          saveAllAnnouncementsInUI(context);
                        },
                        child: Text(
                          'Upload',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),*/
                    ),
                  ],
                ),
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
