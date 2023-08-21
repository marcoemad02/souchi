import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:souchi/authentication/Screens/register_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_snackbar.dart';
import 'home_page.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String? email;
  String? password;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
      // Show a success SnackBar after successful login
      showCustomSnackBar(context, 'Login successful!', SnackBarType.Success);
    } on FirebaseAuthException catch (e) {
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
        child: Column(
          children: [
            const SizedBox(width: double.infinity, height: 20),
            EmailCustomTextFormField(
                'enter your email', 'email', _emailController),
            const SizedBox(width: double.infinity, height: 20),
            PasswordCustomTextFormField(
                'enter your password', 'password', _passwordController),
            const SizedBox(width: double.infinity, height: 20),
            CustomButton(
                onPressed: () => _login(context), buttonLabel: 'Login'),
            const SizedBox(width: double.infinity, height: 20),
            MaterialButton(
              onPressed: () {
                // Navigate to the Home Page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: const Text('Signup'),
            ),
            MaterialButton(
              onPressed: () {
                // Navigate to the Home Page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('under development back door button'),
            ),
          ],
        ),
      ),
    );
  }
}
