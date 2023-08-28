import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/preview/preview_page.dart';
import 'package:souchi/authentication/Screens/register_screen.dart';


import '../../const.dart';
import '../Core/firebase_auth.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/login_ui.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    await loginUser(context, email, password);
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
                      Get.to( PreviewPage());
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


