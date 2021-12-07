import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/models/schedule.dart';
import 'package:interstate_bus_services_app/services/schedule_service.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
import 'package:provider/provider.dart';

void refreshSchedulesInUI(BuildContext context) async {
  String result = await context
      .read<ScheduleService>()
      .getSchedules(context.read<UserService>().currentUser!.email);

  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Data Succefully Loaded!!!');
  }
}

void createNewScheduleInUI(
  BuildContext context, {
  required String fromController,
  required String toController,
  required String timeController,
  required String busCodeController,
}) async {
  if (fromController.isEmpty ||
      toController.isEmpty ||
      timeController.isEmpty ||
      busCodeController.isEmpty) {
    showSnackBar(context, 'Please Enter All Fields First!!');
  } else {
    Schedule schedule = Schedule(
        from: fromController.trim(),
        to: toController.trim(),
        time: timeController.trim(),
        busCode: busCodeController.trim());
    context.read<ScheduleService>().createSchedule(schedule);
    Navigator.pop(context);

    // Check for title duplicate
    /*if (context.read<ScheduleService>().schedules.contains(schedule)) {
      showSnackBar(context, 'Title Already Exist, Change Title');
    } else {
      context.read<ScheduleService>().createSchedule(schedule);
      Navigator.pop(context);
    }*/
  }
}

void saveAllSchedulesInUI(BuildContext context) async {
  String result = await context
      .read<ScheduleService>()
      .saveScheduleEntry(context.read<UserService>().currentUser!.email, true);

  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Schedule Saved!!!');
  }
}
