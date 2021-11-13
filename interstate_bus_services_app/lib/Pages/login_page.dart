import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/helper_user.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final profileFormKey = GlobalKey<FormState>();
  // To capture input
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: profileFormKey,
                      child: Column(
                        children: [
                          TextFormFields(
                            hint: 'Email',
                            regExp: r'^(\+27|0)[6-8][0-9]{8}$',
                            controller: emailController,
                          ),
                          SizedBox(height: 5),
                          PasswordFormFields(
                            hint: 'Password',
                            // Minimum eight characters, at least one letter, one number and one special character
                            regExp:
                                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
                            controller: passController,
                          ),
                          SizedBox(height: 40),
                          ElevatedButton(
                            style: buttonStyle(),
                            child: Text('Login'),
                            onPressed: () {
                              loginUserInUI(context,
                                  email: emailController.text,
                                  password: passController.text);
                              /*
                            if (profileFormKey.currentState!.validate()) {
                              print('Submitting To Server...');
                            }*/
                            },
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: buttonStyle(),
                            child: Text('Reset Password'),
                            onPressed: () {},
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: buttonStyle(),
                            child: Text('Back'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Checking on {showUserProgress} and {userProgressText}
              Selector<UserService, Tuple2>(
                  selector: (context, value) =>
                      Tuple2(value.showUserProgress, value.userProgressText),
                  builder: (context, value, child) {
                    return value.item1
                        ? AppProgressIndicator(text: '${value.item2}')
                        : Container();
                  }),
            ],
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
        if (value!.length == 0 || !RegExp(regExp).hasMatch(value)) {
          return 'Enter All Info';
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
