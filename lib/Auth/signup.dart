import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/screen/home.dart';
import '../widgets/constants.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/cutsom_logo.dart';

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
            SizedBox(height: 10),
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
                  onPressed: () {
                    signUp();
                  },
                  color: Colors.black38,
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
            ),
          ],
        ),
      ),
    );
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        print(emailController.text);
        print(passwordController.text);
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
