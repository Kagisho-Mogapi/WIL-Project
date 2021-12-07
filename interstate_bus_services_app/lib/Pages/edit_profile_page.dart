import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/edit_profile.dart';
import 'package:interstate_bus_services_app/widgets/regexes.dart';
import 'package:interstate_bus_services_app/widgets/snack_bars.dart';
import 'package:provider/provider.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        body: Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Background1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Opacity(
              opacity: 0.85,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.red, Colors.blue]),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: profileFormKey,
                    child: Column(
                      children: [
                        MyTextFormField(
                          hint: 'Edit First Name',
                          regExp: MyRegexes.name,
                          controller: fNameController,
                          detailName: 'fName',
                        ),
                        SizedBox(height: 5),
                        MyTextFormField(
                          hint: 'Edit Last Name',
                          regExp: MyRegexes.name,
                          controller: lNameController,
                          detailName: 'lName',
                        ),
                        SizedBox(height: 5),
                        MyTextFormField(
                          hint: 'Edit Phone Number',
                          regExp: MyRegexes.phonenumber,
                          controller: phoneNoController,
                          detailName: 'phoneNumber',
                        ),
                        SizedBox(height: 5),
                        MyTextFormField(
                          hint: 'Edit Email',
                          regExp: MyRegexes.email,
                          controller: emailController,
                          detailName: 'email',
                        ),
                        SizedBox(height: 5),
                        MyPasswordFormField(
                          hint: 'Enter New Password',
                          // Minimum eight characters, at least one letter, one number and one special character
                          regExp: MyRegexes.password,
                          controller: newPassController,
                        ),
                        SizedBox(height: 5),
                        MyPasswordFormField(
                          hint: 'Confirm New Password',
                          // Minimum eight characters, at least one letter, one number and one special character
                          regExp: MyRegexes.password,
                          controller: confirmPassController,
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          style: buttonStyle(),
                          child: Text('Submit'),
                          onPressed: () async {
                            if (profileFormKey.currentState!.validate()) {
                              print('Submitting To Server...');

                              UserService().updateProfile(
                                  context,
                                  fNameController.text.trim(),
                                  lNameController.text.trim(),
                                  phoneNoController.text.trim(),
                                  newPassController.text.trim());

                              String result = await context
                                  .read<UserService>()
                                  .checkIfUserLoggedIn();
                              print('Loggin results: $result');

                              Navigator.pop(context);
                            } else {
                              showSnackBar(context,
                                  'Enter correct data type for each field');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
