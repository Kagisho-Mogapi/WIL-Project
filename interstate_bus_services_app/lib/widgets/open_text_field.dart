import 'package:flutter/material.dart';

class OpenTextField extends StatelessWidget {
  const OpenTextField({
    Key? key,
    required this.hint,
    required this.regExp,
    required this.controller,
    required this.isPass,
  }) : super(key: key);

  final String hint;
  final String regExp;
  final TextEditingController controller;
  final bool isPass;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPass,
      style: TextStyle(fontSize: 15),
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
        isDense: true,
      ),
      validator: (value) {
        if (value!.length == 0 || !RegExp(regExp).hasMatch(value)) {
          return 'Enter All Info';
        }
      },
    );
  }
}
