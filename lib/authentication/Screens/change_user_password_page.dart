import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/const.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_snackbar.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  Future<void> _changePassword(BuildContext context) async {
    String oldPassword = _oldPasswordController.text.trim();
    String newPassword = _newPasswordController.text.trim();

    try {
      User? user = FirebaseAuth.instance.currentUser;

      // Re-authenticate the user before changing the password
      AuthCredential credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: oldPassword,
      );

      await user.reauthenticateWithCredential(credential);

      // Change the password
      await user.updatePassword(newPassword);

      Get.back(); // Go back to the profile screen

      // Show a success SnackBar
      showCustomSnackBar(
          context, 'Password changed successfully!', SnackBarType.Success);
    } on FirebaseAuthException catch (e) {
      // Show an error SnackBar
      showCustomSnackBar(context, 'Error: ${e.message}', SnackBarType.Error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Change Password'), backgroundColor: kPrimaryColor),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            PasswordCustomTextFormField('Enter old your Password',
                'Old password', _oldPasswordController),
            const SizedBox(
              height: 25,
            ),
            PasswordCustomTextFormField(
                'Enter your new', 'New password', _newPasswordController),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              buttonLabel: 'Change Password',
              onPressed: () => _changePassword(context),
            )
          ],
        ),
      ),
    );
  }
}
