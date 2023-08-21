import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_form_field.dart';
import '../widgets/custom_snackbar.dart';

class ChangeEmailScreen extends StatelessWidget {
  final TextEditingController _newEmailController = TextEditingController();

  Future<void> _changeEmail(BuildContext context) async {
    String newEmail = _newEmailController.text.trim();

    try {
      User? user = FirebaseAuth.instance.currentUser;

      await user!.updateEmail(newEmail);

      Get.back(); // Go back to the profile screen

      // Show a success SnackBar
      showCustomSnackBar(context, 'Email changed successfully!', SnackBarType.Success);
    } on FirebaseAuthException catch (e) {
      // Show an error SnackBar
      showCustomSnackBar(context, 'Error: ${e.message}', SnackBarType.Error);
      print( e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: _newEmailController,
              decoration: InputDecoration(labelText: 'New Email'),
            ),
            ElevatedButton(
              onPressed: () => _changeEmail(context),
              child: Text('Change Email'),
            ),
          ],
        ),
      ),
    );
  }
}
