import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souchi/authentication/Screens/register_screen.dart';

import '../../const.dart';
import '../../views/pages/BranchPage/branch_view.dart';
import '../../views/widgets/TextField_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_snackbar.dart';
import '../widgets/login_ui.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // User successfully logged in, store the login status
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BranchScreen()),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
              UpperPartLogin(
              text: 'Login',
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: 'Enter your email',
                    iconSvgPath: 'assets/icons/Mail.svg',
                    controller : _emailController,
                    errorMessage: 'Please enter a valid email address',
                  ),


                  const SizedBox(width: double.infinity, height: 20),
                  CustomTextFormField(
                    labelText: 'Enter your password',
                    iconSvgPath: 'assets/icons/Lock.svg',
                    controller: _passwordController,
                    obscureText: true,
                    errorMessage: 'Please enter a valid password',
                  ),
                  const SizedBox(width: double.infinity, height: 20),
                  CustomButton(
                      onPressed: () => _login(context), buttonLabel: 'Login'),
                  DiveIntoButton(
                    onPressed: () {
                      // Navigate to the Home Page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BranchScreen()),
                      );
                    },
                    buttonLabel: 'Dive into Sushi Experience',
                  ),
                  MaterialButton(
                    // Navigate to the Home Page when the button is pressed
                    onPressed: () {
                      // Navigate to the Home Page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text('Create new account, SignUp',
                        style: TextStyle(color: kPrimaryColor, fontSize:20)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




