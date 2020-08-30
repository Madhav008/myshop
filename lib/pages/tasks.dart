import 'package:flutter/material.dart';
import 'package:myshop/controllers/authentications.dart';
import 'package:myshop/widgets/constants.dart';

import '../main.dart';
import 'drawer.dart';

class TasksPage extends StatelessWidget {
  final String uid;
  TasksPage({this.uid});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: kSecondaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "My Shop",
              style: TextStyle(
                fontFamily: "tepeno",
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.exit_to_app),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => AuthService().signOutUser().then((value) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false);
                }),
            
              )],
              ),
          drawer: CustomDrawer(uid)
    );
  }
}
