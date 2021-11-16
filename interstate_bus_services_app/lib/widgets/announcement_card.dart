import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:interstate_bus_services_app/models/announcement.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({
    Key? key,
    required this.message,
    required this.deletaAction,
    //required this.messageToggleAction,
  }) : super(key: key);

  final Announcement message;
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
            message.title,
            style: TextStyle(
              color: Colors.orange[900],
            ),
          ),
          subtitle: Text(
              '${message.created.day}/${message.created.month}/${message.created.year}',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[200],
              )),
        ),
      ),
    );
  }
}
