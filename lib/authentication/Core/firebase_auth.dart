import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/views/pages/BranchPage/branch_view.dart';

import '../Screens/login_screen.dart';
import '../widgets/custom_snackbar.dart';
import 'Shared_pref.dart';

Future<DocumentSnapshot> getCurrentUser(String uid) async {
  return await FirebaseFirestore.instance.collection('users').doc(uid).get();
}

Future<void> loginUser(
    BuildContext context, String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await getCurrentUser(value.user!.uid).then((value) async {
        int points = value.get('points');
        String uid = value.get('id');
        String name = value.get('name');

        SharedPreferencesManager.saveUserData(points, uid, name);
      });
    });
    SharedPreferencesManager.saveLoggedInStatus(true);

    Get.offAll(const BranchScreen());
    showCustomSnackBar(context, 'Login successful!', SnackBarType.Success);
  } on FirebaseAuthException catch (e) {
    showCustomSnackBar(context, 'Error: ${e.message}', SnackBarType.Error);
  }
}

Future<void> registerUser(BuildContext context, String name, String phone,
    String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    // User registered successfully, store additional user information in Firebase database
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'name': name,
      'email': email,
      'phone': phone,
      'points': 0,
      'id': userCredential.user!.uid
      // Store additional user information here as needed
    });

    // Show a success SnackBar after successful registration
    showCustomSnackBar(
        context, 'Registration successful!', SnackBarType.Success);
    Get.to(() => LoginPage());
    // Navigate to the home page or perform other actions
    // after successful registration.
  } on FirebaseAuthException catch (e) {
    // Handle registration errors
    // print('Error: ${e.message}');

    // Show an error SnackBar if there is an authentication error
    showCustomSnackBar(context, 'Error: ${e.message}', SnackBarType.Error);
  }
}
