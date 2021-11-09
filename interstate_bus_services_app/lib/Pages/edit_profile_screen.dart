import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // To capture input
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    phoneNoController.dispose();
    emailController.dispose();
    oldPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFields(
                  hint: 'Enter First Name',
                  keyType: TextInputType.text,
                  controller: fNameController,
                ),
                SizedBox(height: 10),
                TextFields(
                    hint: 'Enter Last Name',
                    keyType: TextInputType.text,
                    controller: lNameController),
                SizedBox(height: 10),
                TextFields(
                  hint: 'Enter Phone Number',
                  keyType: TextInputType.phone,
                  controller: phoneNoController,
                ),
                SizedBox(height: 10),
                TextFields(
                  hint: 'Enter Email',
                  keyType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(height: 10),
                PasswordFields(
                  hint: 'Enter Old Password',
                  controller: oldPassController,
                ),
                SizedBox(height: 10),
                PasswordFields(
                  hint: 'Enter New Password',
                  controller: newPassController,
                ),
                SizedBox(height: 10),
                PasswordFields(
                  hint: 'Confirm New Password',
                  controller: confirmPassController,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: buttonStyle(),
                  child: Text('Submit'),
                  onPressed: () {},
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    style: buttonStyle(),
                    child: Text('View Profile'),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  const TextFields(
      {Key? key,
      required this.hint,
      required this.keyType,
      required this.controller})
      : super(key: key);

  final String hint;
  final TextInputType keyType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 15),
      controller: controller,
      keyboardType: keyType,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }
}

class PasswordFields extends StatelessWidget {
  const PasswordFields({Key? key, required this.hint, required this.controller})
      : super(key: key);

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 15),
      controller: controller,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }
}

ButtonStyle buttonStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.blue),
    fixedSize: MaterialStateProperty.all(Size.fromWidth(220)),
  );
}
