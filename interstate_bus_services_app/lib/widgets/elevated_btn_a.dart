import 'package:flutter/material.dart';

class MyElevatedBtnA extends StatelessWidget {
  const MyElevatedBtnA({
    Key? key,
    required this.btnName,
    required this.routeName,
  }) : super(key: key);

  final String btnName;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Text(
            btnName,
            style: TextStyle(fontSize: 15),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(routeName);
          //print(context.read<AnnouncementService>().busyRetrieving);
        },
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
          fixedSize: MaterialStateProperty.all(Size.fromWidth(220)),
        ),
      ),
    );
  }
}
