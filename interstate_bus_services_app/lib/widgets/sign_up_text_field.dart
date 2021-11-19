import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  const SignUpTextField({
    Key? key,
    required this.controller,
    required this.labeltext,
    required this.keyboardType,
    this.hideText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String labeltext;
  final TextInputType keyboardType;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20, right: 20),
      child: TextField(
        obscureText: hideText,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.red.shade300,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          //errorStyle: ,
          labelStyle: TextStyle(color: Colors.grey.shade600),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
          labelText: labeltext,
        ),
      ),
    );
  }
}
