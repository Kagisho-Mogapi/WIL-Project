import 'package:flutter/material.dart';

class CreateAnnouncement extends StatefulWidget {
  const CreateAnnouncement({Key? key}) : super(key: key);

  @override
  _CreateAnnouncementState createState() => _CreateAnnouncementState();
}

class _CreateAnnouncementState extends State<CreateAnnouncement> {
  late TextEditingController announcementController;

  final List<String> administrators = [
    'Bus Driver 1',
    'Bus Driver 2',
    'All Commuters',
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
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Center(
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
                      padding: const EdgeInsets.only(top: 2.0),
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.red[400]),
                        onPressed: () {},
                        child: Text('Upload'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
