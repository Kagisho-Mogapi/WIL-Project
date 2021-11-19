import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:interstate_bus_services_app/models/schedule.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
    required this.message,
    required this.deletaAction,
    //required this.messageToggleAction,
  }) : super(key: key);

  final Schedule message;
  final Function() deletaAction;
  //final Function(bool? value) messageToggleAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            color: Colors.grey,
            icon: Icons.delete,
            onTap: deletaAction,
          )
        ],
        child: ListTile(
          tileColor: Colors.lightBlueAccent,
          title: Text(
            'From: ${message.from}, To: ${message.to}, Time: ${message.time}, Bus Code: ${message.busCode} ',
            style: TextStyle(
              color: Colors.orange[900],
            ),
          ),
          /*subtitle: Text(
              '${message.created.day}/${message.created.month}/${message.created.year}',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[200],
              )),*/
        ),
      ),
    );
  }
}
