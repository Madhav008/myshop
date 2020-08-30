import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myshop/controllers/authentications.dart';
import 'package:myshop/main.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  String uid;
  CustomDrawer(this.uid);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            Firestore.instance.collection('users').document(uid).snapshots(),
        builder: (context, snapshot) {
          return Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                  ),
                  accountEmail: Text(
                    snapshot.data['email'],
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  accountName: Text(
                    snapshot.data['name'],
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image(
                      image: NetworkImage(
                         snapshot.data['image']),
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  onTap: () {},
                  title: Text("Home"),
                  leading: Icon(EvaIcons.homeOutline),
                ),
                SizedBox(height: 10),
                ListTile(
                  title: Text("Account"),
                  leading: Icon(EvaIcons.personOutline),
                ),
                SizedBox(height: 10),
                ListTile(
                  title: Text("Electronics"),
                  leading: Icon(EvaIcons.bulbOutline),
                ),
                SizedBox(height: 10),
                ListTile(
                  title: Text("Fashion"),
                  leading: Icon(EvaIcons.heartOutline),
                ),
                ListTile(
                  onTap: () => AuthService().signOutUser().then((value) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false);
                  }),
                  title: Text("LogOut"),
                  leading: Icon(EvaIcons.logOut),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        });
  }
}
