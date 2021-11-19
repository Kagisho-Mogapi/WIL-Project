import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/schedule_service.dart';
import 'package:interstate_bus_services_app/services/helper_schedule.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/schedule_card.dart';
import 'package:interstate_bus_services_app/widgets/water_deep_deco.dart';
import 'package:provider/provider.dart' as provider;
import 'package:tuple/tuple.dart';

class ViewBusSchedule extends StatefulWidget {
  const ViewBusSchedule({Key? key}) : super(key: key);

  @override
  _ViewBusScheduleState createState() => _ViewBusScheduleState();
}

class _ViewBusScheduleState extends State<ViewBusSchedule> {
  late TextEditingController scheduleController;

  @override
  void initState() {
    super.initState();
    scheduleController = TextEditingController();
  }

  @override
  void dispose() {
    scheduleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
              icon: Icon(Icons.replay_outlined),
              tooltip: 'Refresh',
              onPressed: () {
                refreshSchedulesInUI(context);
              }),
          SizedBox(width: 10),
          IconButton(
              icon: Icon(Icons.system_update_tv_sharp),
              tooltip: 'Save',
              onPressed: () {
                saveAllSchedulesInUI(context);
              }),
          SizedBox(width: 10),
          IconButton(
              icon: Icon(Icons.add),
              tooltip: 'Write Schedule',
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.writeSchedule);
              }),
          SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        decoration: waterDeepDeco(),
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
                        'View Schedule',
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
                  color: Colors.white,
                  thickness: 2,
                  endIndent: 10,
                  indent: 10,
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 20,
                      ),
                      child: provider.Consumer<ScheduleService>(
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.schedules.length,
                            itemBuilder: (context, index) {
                              return ScheduleCard(
                                message: value.schedules[index],
                                deletaAction: () async {
                                  context
                                      .read<ScheduleService>()
                                      .deleteSchedule(value.schedules[index]);
                                },
                              );
                            },
                          );
                        },
                      )),
                ),
              ],
            ),
          ),
          provider.Selector<ScheduleService, bool>(
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

TextStyle myTextStyle() {
  return TextStyle(fontSize: 15, color: Colors.white);
}
