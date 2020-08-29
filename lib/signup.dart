import 'package:flutter/material.dart';
import 'widgets/constants.dart';
import 'widgets/custom_textfield.dart';
import 'widgets/cutsom_logo.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final phoneController = TextEditingController();

  final nameController = TextEditingController();

  String message = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            CustomLogo(),
            SizedBox(
              height: height * .1,
            ),
            CustomTextField(
              controller: nameController,
              icon: Icons.perm_identity,
              hint: 'Enter your name',
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              controller: phoneController,
              hint: 'Enter your number',
              icon: Icons.phone,
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              controller: emailController,
              hint: 'Enter your email',
              icon: Icons.mail,
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              controller: passwordController,
              hint: 'Enter your password',
              icon: Icons.lock,
            ),
            SizedBox(
              height: height * .03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Builder(
                builder: (context) => FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () async {
                  },
                  color: Colors.black,
                  child: Text(
                    'SignUp',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Center(
                child: Text(
              message,
              style: TextStyle(fontSize: 20),
            )),
            SizedBox(
              height: height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Do have an account ? ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
