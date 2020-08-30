import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});
  //collection references

  final CollectionReference users = Firestore.instance.collection('users');

  Future updateUserData(
   String imgUrl,   String email, String name, String phone, bool admin) async {
    return await users.document(uid).setData(
        {'image': imgUrl,'email': email, 'name': name, 'phone': phone, 'admin': admin});
  }

  Stream<QuerySnapshot> get user {
    return users.snapshots();
  }
}
