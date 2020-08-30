import 'package:flutter/material.dart';
import 'package:myshop/controllers/authentications.dart';
import 'package:myshop/widgets/custom_textfield.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final emailController = TextEditingController();

  final imageController = TextEditingController();

  final phoneController = TextEditingController();

  final nameController = TextEditingController();

  String message = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              icon: Icons.perm_identity,
              hint: 'Enter your name',
            ),
            SizedBox(
              height: 6 * .02,
            ),
            CustomTextField(
              controller: phoneController,
              hint: 'Enter your number',
              icon: Icons.phone,
            ),
            SizedBox(
              height: 5 * .02,
            ),
            CustomTextField(
              controller: emailController,
              hint: 'Enter your email',
              icon: Icons.mail,
            ),
            SizedBox(
              height: 5 * .02,
            ),
            CustomTextField(
              controller: imageController,
              hint: 'Enter your password',
              icon: Icons.image,
            ),

            FlatButton.icon(onPressed: updateProfile, icon: Icon(Icons.account_box), label: Text("Update Profile"))
          ],
        ),
      ),
    );
  }

  void updateProfile() async {
    AuthService().updateProfile(nameController.text, emailController.text,
        phoneController.text, imageController.text);
  }
}
