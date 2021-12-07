import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/schedule_service.dart';
import 'package:interstate_bus_services_app/services/helper_schedule.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/createScheduleFields.dart';
import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
import 'package:provider/provider.dart' as provider;

class CreateSchedule extends StatefulWidget {
  const CreateSchedule({Key? key}) : super(key: key);

  @override
  _CreateScheduleState createState() => _CreateScheduleState();
}

class _CreateScheduleState extends State<CreateSchedule> {
  TextEditingController toController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController busCodeController = TextEditingController();

  final List<String> time = [
    '15:00',
    '15:15',
    '15:30',
    '15:45',
    '15:00',
    '15:15',
    '15:30',
    '15:45',
    '15:00',
    '15:15',
    '15:30',
  ];

  String? value1;
  String? value2;
  String? value3;
  String? value4;
  // DropdownMenuItem<String> buildMenuItem(String admin) => DropdownMenuItem(
  //     value: admin,
  //     child: Text(
  //       admin,
  //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  //     ));
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
  // String radioButtonItem = 'Mondays to Fridays';
  // String areaItem = 'Botshabelo';
  int fromID = 1;
  int fromArea = 1;
  int toID = 1;
  int toArea = 1;

  // DropdownMenuItem<String> buildMenuItem(String item) =>
  //     DropdownMenuItem(value: item, child: Text(item));

  /*@override
  void initState() {
    super.initState();
    scheduleController = TextEditingController();
  }*/

  final items = ['Route 1', 'Route 2', 'Route 3'];
  String? value;
  String radioButtonItem = 'Mondays to Fridays';
  String areaItem = 'Botshabelo';
  int id = 1;
  int area = 1;

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  @override
  void dispose() {
    toController.dispose();
    fromController.dispose();
    timeController.dispose();
    busCodeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      //backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
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
          SafeArea(
            //child: Container(
            //height: 1000,
            //width: 1000,
            //decoration: waterDeepDeco(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ////
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
                            child: DropdownButton<String>(
                              items: toRoute.map(buildMenuItem).toList(),
                              onChanged: (value) =>
                                  setState(() => this.toValue = value),
                              value: this.toValue,
                              hint: Text('Choose Route'),
                            ),
                          ),
                        ]),
                  ),

                  MyCreateScheduleFields(
                      controller: timeController, hint: 'Enter Departure Time'),

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
                        if (fromValue == null ||
                            toValue == null ||
                            timeController.text.trim().isEmpty) {
                          showSnackBar(context, 'Please Enter All Fields!!');
                        } else {
                          // Are they both needed?
                          createNewScheduleInUI(context,
                              fromController: fromValue!,
                              toController: toValue!,
                              timeController: timeController.text.trim(),
                              busCodeController: toValue!);
                          saveAllSchedulesInUI(context);
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
                  // ElevatedButton(
                  //     onPressed: () {
                  //       ViewBusSchedule.fromRoute = this.fromValue;
                  //       ViewBusSchedule.toRoute = this.toValue;
                  //       Navigator.pushNamed(context, RouteManager.schedule);
                  //       refreshSchedulesInUI(context);
                  //     },
                  //     child: Text('View Schedule')),

                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///

                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Create Schedule',
                  //         style: TextStyle(
                  //           fontSize: 22,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image.asset(
                  //         'assets/images/Interstatelogo.jpg',
                  //         alignment: Alignment.center,
                  //         width: 394,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(
                  //   height: 15,
                  //   thickness: 5,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Schedule',
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: SingleChildScrollView(
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         ////
                  //         ///
                  //         ///

                  //         // AreaAndDayChoice(),

                  //         ////
                  //         ///
                  //         ///
                  //         ///
                  //         ///
                  //         MyCreateScheduleFields(
                  //             controller: fromController,
                  //             hint: 'Enter From Location'),
                  //         MyCreateScheduleFields(
                  //             controller: toController,
                  //             hint: 'Enter To Location'),
                  //         MyCreateScheduleFields(
                  //             controller: timeController,
                  //             hint: 'Enter Departure Time'),
                  //         MyCreateScheduleFields(
                  //             controller: busCodeController,
                  //             hint: 'Enter Bus Code'),
                  //       ],
                  //     ),
                  //   ),
                  // // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ElevatedButton(
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(top: 7, bottom: 7),
                  //       child: Text(
                  //         'Upload',
                  //         style: TextStyle(fontSize: 15),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       if (fromController.text.trim().isEmpty ||
                  //           toController.text.trim().isEmpty ||
                  //           timeController.text.trim().isEmpty ||
                  //           busCodeController.text.trim().isEmpty) {
                  //         showSnackBar(context, 'Please Enter All Fields!!');
                  //       } else {
                  //         // Are they both needed?
                  //         createNewScheduleInUI(context,
                  //             fromController: fromController,
                  //             toController: toController,
                  //             timeController: timeController,
                  //             busCodeController: busCodeController);
                  //         saveAllSchedulesInUI(context);
                  //       }
                  //     },
                  //     style: ButtonStyle(
                  //       shadowColor: MaterialStateProperty.all(Colors.white),
                  //       backgroundColor:
                  //           MaterialStateProperty.all(Colors.blue[900]),
                  //       fixedSize:
                  //           MaterialStateProperty.all(Size.fromWidth(220)),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          provider.Selector<ScheduleService, bool>(
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
