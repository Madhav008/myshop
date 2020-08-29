import 'package:flutter/material.dart';
import 'package:myshop/signup.dart';

import 'widgets/constants.dart';
import 'widgets/custom_textfield.dart';
import 'widgets/cutsom_logo.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              hint: 'Enter your email',
              icon: Icons.email,
              controller: emailController,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: passwordController,
              hint: 'Enter your password',
              icon: Icons.lock,
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Builder(
                builder: (context) => FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () => null,
                  color: Colors.black,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .01,
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
                  'Don\'t have an account ? ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return SignupScreen();
                      },
                    ));
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: null,
                    child: Container(
                      height: 80,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage('images/icons/facebook.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: null,
                    child: Container(
                      height: 80,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage('images/icons/google.jpg'),
                        ),
                      ),
                    ),
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
