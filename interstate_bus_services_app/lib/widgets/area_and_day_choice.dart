import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Pages/view_bus_schedule.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/helper_schedule.dart';

class AreaAndDayChoice extends StatefulWidget {
  const AreaAndDayChoice({Key? key}) : super(key: key);

  @override
  _AreaAndDayChoiceState createState() => _AreaAndDayChoiceState();
}

class _AreaAndDayChoiceState extends State<AreaAndDayChoice> {
  List<String> botshabeloArea = [
    'A1',
    'A4',
    'N1',
    'C1 ',
    'F3',
    'J3',
  ];
  List<String> mangaungArea = [
    'Limo Mall',
    'Central Park',
    'Mafora',
    'Phase 2',
    'Turflaagte',
    'Bloemside'
  ];
  List<String> suburbsArea = [
    'Bayswater',
    'Brandwag',
    'Vista',
    'Universitas',
    'Bidvest',
    'Fauna'
  ];
  List<String> thabaNchuArea = [
    'Mokwena',
    'Morago',
    'Paradys',
    'Moroto',
    'Sediba',
    'Merino'
  ];
  List<String> fromRoute = [
    'A1',
    'A4',
    'N1',
    'C1 ',
    'F3',
    'J3',
  ];
  List<String> toRoute = [
    'A1',
    'A4',
    'N1',
    'C1 ',
    'F3',
    'J3',
  ];
  String? fromValue;
  String? toValue;
  String radioButtonItem = 'Mondays to Fridays';
  String areaItem = 'Botshabelo';
  int fromID = 1;
  int fromArea = 1;
  int toID = 1;
  int toArea = 1;

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Day of the week',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 1,
                    groupValue: fromID,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Mondays to Fridays';
                        fromID = 1;
                      });
                    },
                  ),
                  Text('Mondays to Fridays'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 2,
                    groupValue: fromID,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Saturdays';
                        fromID = 2;
                      });
                    },
                  ),
                  Text('Saturdays'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 3,
                    groupValue: fromID,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Sundays';
                        fromID = 3;
                      });
                    },
                  ),
                  Text('Sundays'),
                ],
              ),
            ),
            Divider(height: 15, thickness: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'From Area',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 1,
                    groupValue: fromArea,
                    onChanged: (val) {
                      setState(() {
                        areaItem = 'Botshabelo';
                        fromArea = 1;
                        fromRoute = botshabeloArea;
                        this.fromValue = null;
                      });
                    },
                  ),
                  Text('Botshabelo'),
                  Radio(
                    value: 2,
                    groupValue: fromArea,
                    onChanged: (val) {
                      setState(() {
                        areaItem = 'Mangaung';
                        fromArea = 2;
                        fromRoute = mangaungArea;
                        this.fromValue = null;
                      });
                    },
                  ),
                  Text('Mangaung'),
                  Radio(
                    value: 3,
                    groupValue: fromArea,
                    onChanged: (val) {
                      setState(() {
                        areaItem = 'Suburbs';
                        fromArea = 3;
                        fromRoute = suburbsArea;
                        this.fromValue = null;
                      });
                    },
                  ),
                  Text('Suburbs'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 4,
                    groupValue: fromArea,
                    onChanged: (val) {
                      setState(() {
                        areaItem = 'Thaba Nchu';
                        fromArea = 4;
                        fromRoute = thabaNchuArea;

                        this.fromValue = null;
                      });
                    },
                  ),
                  Text('Thaba Nchu'),
                  // Radio(
                  //   value: 5,
                  //   groupValue: area,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       areaItem = 'Other';
                  //       area = 5;
                  //     });
                  //   },
                  // ),
                  // Text('Other'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'From Route',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  child: DropdownButton<String>(
                    items: fromRoute.map(buildMenuItem).toList(),
                    onChanged: (value) =>
                        setState(() => this.fromValue = value),
                    value: this.fromValue,
                    hint: Text('Choose Route'),
                  ),
                ),
              ]),
            ),

            Divider(height: 15, thickness: 5),
            SizedBox(height: 10),

            ///
            ///
            ///
            ///
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'To Area',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 1,
                    groupValue: toArea,
                    onChanged: (val) {
                      setState(() {
                        areaItem = 'Botshabelo';
                        toArea = 1;
                        toRoute = botshabeloArea;
                        this.toValue = null;
                      });
                    },
                  ),
                  Text('Botshabelo'),
                  Radio(
                    value: 2,
                    groupValue: toArea,
                    onChanged: (val) {
                      setState(() {
                        areaItem = 'Mangaung';
                        toArea = 2;
                        toRoute = mangaungArea;
                        this.toValue = null;
                      });
                    },
                  ),
                  Text('Mangaung'),
                  Radio(
                    value: 3,
                    groupValue: toArea,
                    onChanged: (val) {
                      setState(() {
                        areaItem = 'Suburbs';
                        toArea = 3;
                        toRoute = suburbsArea;
                        this.toValue = null;
                      });
                    },
                  ),
                  Text('Suburbs'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 4,
                    groupValue: toArea,
                    onChanged: (val) {
                      setState(() {
                        areaItem = 'Thaba Nchu';
                        toArea = 4;
                        toRoute = thabaNchuArea;

                        this.toValue = null;
                      });
                    },
                  ),
                  Text('Thaba Nchu'),
                  // Radio(
                  //   value: 5,
                  //   groupValue: area,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       areaItem = 'Other';
                  //       area = 5;
                  //     });
                  //   },
                  // ),
                  // Text('Other'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'To Route',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  child: DropdownButton<String>(
                    items: toRoute.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() => this.toValue = value),
                    value: this.toValue,
                    hint: Text('Choose Route'),
                  ),
                ),
              ]),
            ),

            ElevatedButton(
                onPressed: () {
                  ViewBusSchedule.fromRoute = this.fromValue;
                  ViewBusSchedule.toRoute = this.toValue;
                  Navigator.pushNamed(context, RouteManager.schedule);
                  refreshSchedulesInUI(context);
                },
                child: Text('View Schedule'))
          ],
        ),
      ),
    );
  }
}
