import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Functions/user_role.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/schedule_service.dart';
import 'package:interstate_bus_services_app/services/helper_schedule.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/schedule_card.dart';
import 'package:provider/provider.dart' as provider;

class ViewBusSchedule extends StatefulWidget {
  const ViewBusSchedule({Key? key}) : super(key: key);
  static String? fromRoute;
  static String? toRoute;
  @override
  _ViewBusScheduleState createState() => _ViewBusScheduleState();
}

class _ViewBusScheduleState extends State<ViewBusSchedule> {
  late TextEditingController scheduleController;
  String? fromRoute = ViewBusSchedule.fromRoute;
  String? toRoute = ViewBusSchedule.toRoute;

  bool hasServices = false;
  int index = 0;
  bool scheduleChecked = false;
  Widget schedules = Container();
  Widget loadingSchedules = Container();

  bool shownServiceStatus = false;

  @override
  void initState() {
    super.initState();
    scheduleController = TextEditingController();
    // context
    //     .read<ScheduleService>()
    //     .getSchedules(context.read<UserService>().currentUser!.email);
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
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
              icon: Icon(Icons.replay_outlined),
              tooltip: 'Refresh',
              onPressed: () {
                refreshSchedulesInUI(context);
              }),
          SizedBox(width: 10),
          UserRole.userRole == 'admin' ? adminWidgets(context) : Container()
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(children: [
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
              // Expanded(
              //   child: Padding(
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: 8.0,
              //         vertical: 20,
              //       ),
              //       child: provider.Consumer<UserService>(
              //         builder: (context, value, child) {
              //           return ListView.builder(
              //             itemCount: value.users.length,
              //             itemBuilder: (context, index) {
              //               // print('List is : ${value.users.length.toString()}');
              //               return UserCard(
              //                 message: value.userEntry!.email[index],
              //               );
              //             },
              //           );
              //         },
              //       )),
              // ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 20,
                    ),
                    child: provider.Consumer<ScheduleService>(
                      builder: (context, value, child) {
                        //Note: It will first return the ListView then run the
                        //  following code

                        loadingSchedules = ListView.builder(
                          itemCount: value.schedules.length,
                          itemBuilder: (context, index) {
                            while (this.index < value.schedules.length &&
                                !scheduleChecked) {
                              if (value.schedules[this.index].from ==
                                      fromRoute &&
                                  value.schedules[this.index].to == toRoute &&
                                  !hasServices) {
                                hasServices = true;
                              }
                              this.index++;
                            }
                            scheduleChecked = true;

                            if (hasServices) {
                              if (value.schedules[index].from == fromRoute &&
                                  value.schedules[index].to == toRoute) {
                                schedules = ScheduleCard(
                                  message: value.schedules[index],
                                  deletaAction: () async {
                                    context
                                        .read<ScheduleService>()
                                        .deleteSchedule(value.schedules[index]);
                                  },
                                );
                              } else {
                                schedules = Container();
                              }
                            }
                            // print(hasServices.toString());

                            return schedules;
                          },
                        );
                        print(hasServices.toString());
                        if (!hasServices &&
                            !shownServiceStatus &&
                            scheduleChecked) {
                          // print('In here!!');
                          loadingSchedules = Text(
                            'No services',
                            style: TextStyle(fontSize: 30),
                          );
                        }
                        // print('Current widget: ' + loadingSchedules.toString());

                        return loadingSchedules;
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
                    text: 'Retrieving data from the database... Please wait...')
                : Container();
          },
        )
      ]),
    );
  }
}

TextStyle myTextStyle() {
  return TextStyle(fontSize: 15, color: Colors.white);
}

Container adminWidgets(BuildContext context) {
  return Container(
    child: Row(
      children: [
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
  );
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.message,
    //required this.messageToggleAction,
  }) : super(key: key);

  final String message;
  //final Function(bool? value) messageToggleAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      child: ListTile(
        tileColor: Colors.lightBlueAccent,
        title: Text(
          'email: $message,',
          style: TextStyle(
            color: Colors.orange[900],
          ),
        ),
      ),
    );
  }
}
