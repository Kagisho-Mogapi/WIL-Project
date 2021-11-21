import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/helper_user.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/regexes.dart';
import 'package:interstate_bus_services_app/widgets/sign_up_text_field.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController idNumberController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController verifyPasswordController;
  bool isValidFName = true;
  bool isValidLName = true;
  bool isValidEmail = true;
  bool isValidPass = true;
  bool isValidPhoneNo = true;
  bool isValidIDNo = true;
  bool passMatch = true;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    idNumberController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    verifyPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    idNumberController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.grey[200],
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/Register.jpg',
                      alignment: Alignment.center,
                    ),
                  ),
                  Focus(
                    onFocusChange: (value) async {
                      if (!value) {
                        setState(() {
                          if (nameController.text.trim().isEmpty) {
                            isValidFName = true;
                          } else {
                            isValidFName = myInputValidation(
                                nameController.text.trim(), MyRegexes.name);
                          }
                        });
                      }
                    },
                    child: SignUpTextField(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      labeltext: 'Enter Name',
                      errorMsg: 'Letters Only',
                      isValidInput: isValidFName,
                    ),
                  ),
                  Focus(
                    onFocusChange: (value) async {
                      if (!value) {
                        setState(() {
                          if (surnameController.text.trim().isEmpty) {
                            isValidLName = true;
                          } else {
                            isValidLName = myInputValidation(
                                surnameController.text.trim(), MyRegexes.name);
                          }
                        });
                      }
                    },
                    child: SignUpTextField(
                      keyboardType: TextInputType.text,
                      controller: surnameController,
                      labeltext: 'Enter Surname',
                      errorMsg: 'Letters Only',
                      isValidInput: isValidLName,
                    ),
                  ),
                  Focus(
                    onFocusChange: (value) async {
                      if (!value) {
                        setState(() {
                          if (idNumberController.text.trim().isEmpty) {
                            isValidIDNo = true;
                          } else {
                            isValidIDNo = myInputValidation(
                                idNumberController.text.trim(),
                                MyRegexes.number);
                          }
                        });
                      }
                    },
                    child: SignUpTextField(
                      keyboardType: TextInputType.number,
                      controller: idNumberController,
                      labeltext: 'Enter ID Number',
                      errorMsg: 'Numbers Only',
                      isValidInput: isValidIDNo,
                    ),
                  ),
                  Focus(
                    onFocusChange: (value) async {
                      if (!value) {
                        setState(() {
                          if (phoneNumberController.text.trim().isEmpty) {
                            isValidPhoneNo = true;
                          } else {
                            isValidPhoneNo = myInputValidation(
                                phoneNumberController.text.trim(),
                                MyRegexes.phonenumber);
                          }
                        });
                      }
                    },
                    child: SignUpTextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneNumberController,
                      labeltext: 'Enter Phone Number',
                      errorMsg: 'Ten Numbers Only',
                      isValidInput: isValidPhoneNo,
                    ),
                  ),
                  Focus(
                    onFocusChange: (value) async {
                      if (!value) {
                        setState(() {
                          if (emailController.text.trim().isEmpty) {
                            isValidEmail = true;
                          } else {
                            isValidEmail = myInputValidation(
                                emailController.text.trim(), MyRegexes.email);
                            if (isValidEmail) {
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
                      labeltext: 'Enter Email Address',
                      errorMsg: 'Not Correct Email Format',
                      isValidInput: isValidEmail,
                    ),
                  ),
                  Selector<UserService, bool>(
                    selector: (context, value) => value.userExists,
                    builder: (context, value, child) {
                      Widget result;
                      if (value) {
                        result = Text(
                          'User already exixts',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        result = Container();
                      }
                      return result;
                    },
                  ),
                  Focus(
                    onFocusChange: (value) async {
                      if (!value) {
                        setState(() {
                          if (passwordController.text.trim().isEmpty) {
                            isValidPass = true;
                          } else {
                            isValidPass = myInputValidation(
                                passwordController.text.trim(),
                                MyRegexes.password);
                          }
                        });
                      }
                    },
                    child: SignUpTextField(
                      hideText: true,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      labeltext: 'Enter Password',
                      errorMsg:
                          'Minimum eight characters, at least one letter, one number and one special character',
                      isValidInput: isValidPass,
                    ),
                  ),
                  Focus(
                    onFocusChange: (value) async {
                      if (!value) {
                        setState(() {
                          if (verifyPasswordController.text.trim().isEmpty) {
                            isValidPass = true;
                          } else {
                            passMatch = passwordMatch(
                                passwordController.text.trim(),
                                verifyPasswordController.text.trim());
                          }
                        });
                      }
                    },
                    child: SignUpTextField(
                      hideText: true,
                      keyboardType: TextInputType.text,
                      controller: verifyPasswordController,
                      labeltext: 'Verify Password',
                      errorMsg: "Passwords Don't Match",
                      isValidInput: passMatch,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: MaterialButton(
                      height: 50,
                      minWidth: 200,
                      color: Colors.red[700],
                      onPressed: () {
                        createNewUserInUI(
                          context,
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          fName: nameController.text.trim(),
                          lName: surnameController.text.trim(),
                          idNumber: idNumberController.text.trim(),
                          phoneNumber: phoneNumberController.text.trim(),
                        );
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  /*Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.red[400]),
                        onPressed: () {
                          // Passing New User Details
                          createNewUserInUI(
                            context,
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            fName: nameController.text.trim(),
                            lName: surnameController.text.trim(),
                            idNumber: idNumberController.text.trim(),
                            phoneNumber: phoneNumberController.text.trim(),
                          );
                        },
                        child: Text('Submit'),
                      ),
                    ),*/
                  /*SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('Back'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )*/
                ],
              ),
            ),
          ),
          Selector<UserService, Tuple2>(
            selector: (context, value) =>
                Tuple2(value.showUserProgress, value.userProgressText),
            builder: (context, value, child) {
              return value.item1
                  ? AppProgressIndicator(text: '${value.item2}')
                  : Container();
            },
          )
        ],
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

bool passwordMatch(String firstPass, String secondPass) {
  bool passMatch = false;
  if (firstPass == secondPass) {
    passMatch = true;
  }
  return passMatch;
}
