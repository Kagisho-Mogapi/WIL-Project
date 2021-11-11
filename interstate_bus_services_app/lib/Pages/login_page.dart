import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final profileFormKey = GlobalKey<FormState>();
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: profileFormKey,
                  child: Column(
                    children: [
                      TextFormFields(
                        hint: 'Edit First Name',
                        regExp: r'^[a-z A-Z]+$',
                        controller: fNameController,
                      ),
                      SizedBox(height: 5),
                      TextFormFields(
                        hint: 'Edit Last Name',
                        regExp: r'^[a-z A-Z]+$',
                        controller: lNameController,
                      ),
                      SizedBox(height: 5),
                      TextFormFields(
                        hint: 'Edit Phone Number',
                        regExp: r'^(\+27|0)[6-8][0-9]{8}$',
                        controller: phoneNoController,
                      ),
                      SizedBox(height: 5),
                      TextFormFields(
                        hint: 'Edit Email',
                        regExp:
                            r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
                        controller: emailController,
                      ),
                      SizedBox(height: 5),
                      PasswordFormFields(
                        hint:
                            'Enter Old Password(8 characters, 1 letter, 1 number and 1 special character)',
                        // Minimum eight characters, at least one letter, one number and one special character
                        regExp:
                            r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
                        controller: oldPassController,
                      ),
                      SizedBox(height: 5),
                      PasswordFormFields(
                        hint:
                            'Enter New Password(8 characters, 1 letter, 1 number and 1 special character)',
                        // Minimum eight characters, at least one letter, one number and one special character
                        regExp:
                            r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
                        controller: newPassController,
                      ),
                      SizedBox(height: 5),
                      PasswordFormFields(
                        hint:
                            'Confirm New Password(8 characters, 1 letter, 1 number and 1 special character)',
                        // Minimum eight characters, at least one letter, one number and one special character
                        regExp:
                            r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
                        controller: confirmPassController,
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: buttonStyle(),
                        child: Text('Submit'),
                        onPressed: () {
                          if (profileFormKey.currentState!.validate()) {
                            print('Submitting To Server...');
                          }
                        },
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
          ),
        ),
      ),
    );
  }
}

class TextFormFields extends StatelessWidget {
  const TextFormFields({
    Key? key,
    required this.hint,
    required this.regExp,
    required this.controller,
  }) : super(key: key);

  final String hint;
  final String regExp;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 13),
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
        isDense: true,
      ),
      validator: (value) {
        if (value!.length == 0) {
          return null;
        }
        if (!RegExp(regExp).hasMatch(value)) {
          return 'Enter Correct Info For This Field';
        }
      },
    );
  }
}

class PasswordFormFields extends StatelessWidget {
  const PasswordFormFields({
    Key? key,
    required this.hint,
    required this.regExp,
    required this.controller,
  }) : super(key: key);

  final String hint;
  final String regExp;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      style: TextStyle(fontSize: 13),
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
        isDense: true,
      ),
      validator: (value) {
        if (value!.length == 0) {
          return null;
        }
        if (!RegExp(regExp).hasMatch(value)) {
          return 'Enter Correct Info For This Field';
        }
      },
    );
  }
}

ButtonStyle buttonStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.blue),
    fixedSize: MaterialStateProperty.all(Size.fromWidth(220)),
  );
}
