import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../views/pages/BranchPage/branch_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_snackbar.dart';

import 'home_page.dart';
import 'login_screen.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  String? points;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _register(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String name = _nameController.text.trim();
    String phone = _phoneController.text.trim();


    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // User registered successfully, store additional user information in Firebase database
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email':email,
        'password':password,
        'phone': phone,
        'points':points,
        // Store additional user information here as needed
      });

      // Show a success SnackBar after successful registration
      showCustomSnackBar(
          context, 'Registration successful!', SnackBarType.Success);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      // Navigate to the home page or perform other actions
      // after successful registration.
    } on FirebaseAuthException catch (e) {
      // Handle registration errors
      print('Error: ${e.message}');

      // Show an error SnackBar if there is an authentication error
      showCustomSnackBar(context, 'Error: ${e.message}', SnackBarType.Error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(width: double.infinity, height: 20),
              NameCustomTextFormField(
                  hintText: 'enter your name',
                  labelText: 'name',
                  controller: _nameController),
              const SizedBox(width: double.infinity, height: 20),
              EmailCustomTextFormField(
                  'enter your email', 'email', _emailController),
              const SizedBox(width: double.infinity, height: 20),
              PasswordCustomTextFormField(
                  'enter your password', 'password', _passwordController),
              const SizedBox(width: double.infinity, height: 20),
              PhoneNumberCustomTextField(
                  hintText: 'enter your phone number',
                  labelText: 'phone number',
                  controller: _phoneController),
              CustomButton(
                onPressed: () => _register(context),buttonLabel: 'Register',
              ),
              MaterialButton(
                onPressed: () {
                  // Navigate to the Home Page when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('login page'),
              ),
              MaterialButton(
                onPressed: () {
                  // Navigate to the Home Page when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BranchScreen()),
                  );
                },
                child: const Text('under development back door button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
