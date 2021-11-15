import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:interstate_bus_services_app/models/announcement_entry.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({
    Key? key,
    // required this.message,
    required this.deletaAction,
    required this.messageToggleAction,
  }) : super(key: key);
  // final AnnouncementEntry message;
  final Function() deletaAction;
  final Function(bool? value) messageToggleAction;

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
        child: CheckboxListTile(
          checkColor: Colors.grey[100],
          activeColor: Colors.grey[100],
          tileColor: Colors.grey[700],
          value: false,
          onChanged: messageToggleAction,
          title: Text(
            'Announcement',
            style: TextStyle(
              color: Colors.grey[200],
            ),
          ),
          subtitle: Text('Sent to Bus driver',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[200],
              )),
        ),
      ),
    );
  }
}
