import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/schedule_service.dart';
import 'package:interstate_bus_services_app/services/helper_schedule.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/water_deep_deco.dart';
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

  final List<String> to = [
    'Bloem',
    'Bots',
    'Welkom',
    'Koffiefontein',
  ];

  final List<String> from = [
    'Bloem',
    'Bots',
    'Welkom',
    'Koffiefontein',
  ];

  final List<String> time = [
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
  ];

  final List<String> busCode = [
    'C4',
    'B8',
    'C8',
    'B1',
    'A4',
    'Z8',
    'A2',
    'A7',
  ];

  String? value1;
  String? value2;
  String? value3;
  String? value4;
  DropdownMenuItem<String> buildMenuItem(String admin) => DropdownMenuItem(
      value: admin,
      child: Text(
        admin,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ));

  /*@override
  void initState() {
    super.initState();
    scheduleController = TextEditingController();
  }*/

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
        backgroundColor: Colors.lightBlue,
      ),
      //backgroundColor: Colors.grey[200],
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
                            'Create Schedule',
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
                            'Schedule',
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
                                controller: fromController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: 'Enter From Location',
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
                                controller: toController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: 'Enter To Location',
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
                                controller: timeController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: 'Enter Departure Time',
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
                                controller: busCodeController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: 'Enter Bus Code',
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
                          createNewScheduleInUI(context,
                              fromController: fromController,
                              toController: toController,
                              timeController: timeController,
                              busCodeController: busCodeController);
                          saveAllSchedulesInUI(context);
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
                          createNewScheduleInUI(context,
                              titleController: scheduleController);
                          saveAllSchedulesInUI(context);
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
