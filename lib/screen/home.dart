import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  String user;
  Home({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user),
      ),
    );
  }
}
