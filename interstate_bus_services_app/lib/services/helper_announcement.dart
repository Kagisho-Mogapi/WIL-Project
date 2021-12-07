import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/models/announcement.dart';
import 'package:interstate_bus_services_app/services/announcement_service.dart';
import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
import 'package:provider/provider.dart';

void refreshAnnouncementsInUI(BuildContext context) async {
  String result =
      await context.read<AnnouncementService>().getAnnouncements('');

  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Data Succefully Loaded!!!');
  }
}

void createNewAnnouncementInUI(
  BuildContext context, {
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required String recepientController,
}) async {
  if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
    showSnackBar(context, 'Please Enter Announcement First!!');
  } else {
    Announcement announcement = Announcement(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        level: recepientController.trim(),
        created: DateTime.now());

    // Check for title duplicate
    if (context
        .read<AnnouncementService>()
        .announcements
        .contains(announcement)) {
      showSnackBar(context, 'Title Already Exist, Change Title');
    } else {
      titleController.text = '';
      descriptionController.text = '';
      context.read<AnnouncementService>().createAnnouncement(announcement);
      Navigator.pop(context);
    }
  }
}

void saveAllAnnouncementsInUI(BuildContext context, String recipient) async {
  String result = await context
      .read<AnnouncementService>()
      .saveAnnouncementEntry(recipient, true);

  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Announcement Saved!!!');
  }
}
