import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:myshop/controllers/authentications.dart';
import 'package:myshop/main.dart';
import 'package:myshop/pages/admin.dart';
import 'package:myshop/pages/profile.dart';
import 'package:myshop/pages/tasks.dart';

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
                  accountEmail: (snapshot.data['email'] == null)
                      ? Text("madhavj211@gmail.com")
                      : Text(
                          snapshot.data['email'],
                          style: TextStyle(color: Colors.black),
                        ),
                  accountName: (snapshot.data['name'] == null)
                      ? Text(
                          'No data',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      : Text(
                          snapshot.data['name'],
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                  currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: (snapshot.data['image'] != null)
                        ? Image(
                            image: NetworkImage(snapshot.data['image']),
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          )
                        : Container(),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TasksPage(uid: uid),
                        ));
                  },
                  title: Text("Home"),
                  leading: Icon(EvaIcons.homeOutline),
                ),
                SizedBox(height: 10),
                ListTile(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),)),
                  title: Text("Account"),
                  leading: Icon(EvaIcons.personOutline),
                ),
                SizedBox(height: 10),
                ListTile(
                  title: Text("Add Product"),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminScreen(),)),
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
