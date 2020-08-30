import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/pages/signup.dart';
import '../controllers/authentications.dart';
import '../widgets/constants.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/cutsom_logo.dart';
import 'tasks.dart';

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
                  onPressed: login,
                  color: Colors.black26,
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
                    onTap: () {
                      AuthService().googleSignIn().whenComplete(
                        () async {
                          FirebaseUser user =
                              await FirebaseAuth.instance.currentUser();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => TasksPage(
                                uid: user.uid,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('images/icons/google.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService()
          .signin(emailController.text, passwordController.text, context)
          .then((value) {
        if (value != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TasksPage(uid: value.uid),
              ));
        }
      });
    }
  }
}
