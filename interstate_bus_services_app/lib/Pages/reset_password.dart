import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/helper_user.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/regexes.dart';
import 'package:interstate_bus_services_app/widgets/sign_up_text_field.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController emailController;
  bool isValidInput = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
        ),
        body: Stack(
          children: [
            // Container(
            //   constraints: BoxConstraints.expand(),
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/images/Background1.jpg'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // Opacity(
            //   opacity: 0.85,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter,
            //           colors: [Colors.red, Colors.blue]),
            //     ),
            //   ),
            // ),
            Container(
              height: MediaQuery.of(context).size.height - 82.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
            ),
            Positioned(
                top: 200.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 120.0,
                  width: MediaQuery.of(context).size.width,
                )),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   'Reset Password',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 30,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Image.asset(
                        'assets/images/ResetPassword.jpg',
                        alignment: Alignment.center,
                        width: 300,
                        height: 300,
                      ),
                    ),
                    Focus(
                      onFocusChange: (value) async {
                        if (!value) {
                          setState(() {
                            if (emailController.text.trim().isEmpty) {
                              isValidInput = true;
                            } else {
                              isValidInput = myInputValidation(
                                  emailController.text.trim(), MyRegexes.email);
                              if (isValidInput) {
                                context.read<UserService>().checkIfUserExists(
                                    emailController.text.trim());
                              }
                            }
                          });
                        }
                      },
                      child: SignUpTextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        labeltext: 'Email Address',
                        errorMsg: 'Email Format Incorrect',
                        isValidInput: isValidInput,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[600]),
                          fixedSize:
                              MaterialStateProperty.all(Size.fromWidth(220)),
                        ),
                        onPressed: () {
                          resetPasswordInUI(context,
                              email: emailController.text);
                        },
                        child: Text('Reset Password'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool myInputValidation(String input, String regexe) {
  bool isValid = false;

  if (!RegExp(regexe).hasMatch(input)) {
    isValid = false;
  } else {
    isValid = true;
  }

  return isValid;
}
