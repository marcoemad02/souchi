import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souchi/authentication/Screens/register_screen.dart';

import '../../const.dart';
import '../../views/pages/BranchPage/branch_view.dart';
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
          .signInWithEmailAndPassword(email: email, password: password).then((value) async{

            await getCurrentUser(value.user!.uid).then((value)async {

             print(' new user ${value.get('points').runtimeType}');
             int points=value.get('points');
             String uid=value.get('id');
             String name=value.get('name');

             SharedPreferences prefs = await SharedPreferences.getInstance();
             prefs.setInt('points', points);
             prefs.setString('uid',uid );
             uidT=prefs.getString('uid');
             prefs.setString('name', name);
             print('${prefs.get('uid')}');



            });
      });
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
            const UpperPartLogin(
              text: 'Login',
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  EmailCustomTextFormField(
                      'Enter your email', 'Email', _emailController),
                  const SizedBox(width: double.infinity, height: 20),
                  PasswordCustomTextFormField(
                      'Enter your Password', 'Password', _passwordController),
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
                        style: TextStyle(color: kPrimaryColor, fontSize: 20)),
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
Future<DocumentSnapshot> getCurrentUser(String uid) async{
  return await FirebaseFirestore.instance.collection('users').doc(uid).get();


}