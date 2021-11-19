import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/services/helper_user.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:interstate_bus_services_app/widgets/app_progress_indicator.dart';
import 'package:interstate_bus_services_app/widgets/open_text_field.dart';
import 'package:interstate_bus_services_app/widgets/regexes.dart';
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

  bool? rememberMe = false;

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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, RouteManager.welcome);
            },
          ),
        ),
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
                          Image.asset(
                            'assets/images/login.jpg',
                            alignment: Alignment.center,
                          ),
                          OpenTextField(
                            hint: 'Email',
                            regExp: myRegexe('Email'),
                            controller: emailController,
                            isPass: false,
                          ),
                          SizedBox(height: 5),
                          OpenTextField(
                            hint: 'Password',
                            regExp: 'Password',
                            controller: passController,
                            isPass: true,
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberMe = value;
                                  });
                                },
                              ),
                              Text('Remember Me'),
                            ],
                          ),
                          SizedBox(height: 40),
                          ElevatedButton(
                            style: buttonStyle(),
                            child: Text('Login'),
                            onPressed: () {
                              loginUserInUI(context,
                                  email: emailController.text,
                                  password: passController.text);
                            },
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: buttonStyle(),
                            child: Text('Reset Password'),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteManager.resetPassword);
                            },
                          ),
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

ButtonStyle buttonStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.red[600]),
    fixedSize: MaterialStateProperty.all(Size.fromWidth(220)),
  );
}
