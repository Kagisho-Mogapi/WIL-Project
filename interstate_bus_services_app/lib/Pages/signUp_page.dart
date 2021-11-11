import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/widgets/sign_up_text_field.dart';

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
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey.shade300, Colors.grey.shade200],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Image.asset(
                        'assets/images/Register.png',
                        alignment: Alignment.center,
                      ),
                    ),
                    Focus(
                      onFocusChange: (value) async {
                        if (!value) {}
                      },
                      child: SignUpTextField(
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        labeltext: 'Enter Name',
                      ),
                    ),
                    SignUpTextField(
                      keyboardType: TextInputType.text,
                      controller: surnameController,
                      labeltext: 'Enter Surname',
                    ),
                    SignUpTextField(
                      keyboardType: TextInputType.number,
                      controller: idNumberController,
                      labeltext: 'Enter ID Number',
                    ),
                    SignUpTextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneNumberController,
                      labeltext: 'Enter Phone Number',
                    ),
                    SignUpTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      labeltext: 'Enter Email Address',
                    ),
                    SignUpTextField(
                      hideText: true,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      labeltext: 'Enter Password',
                    ),
                    SignUpTextField(
                      hideText: true,
                      keyboardType: TextInputType.text,
                      controller: verifyPasswordController,
                      labeltext: 'Verify Password',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.red[400]),
                        onPressed: () {},
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
