import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/authentication/widgets/login_ui.dart';
import 'package:souchi/const.dart';

import '../Core/firebase_auth.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';
import 'login_screen.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> register(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String name = _nameController.text.trim();
    String phone = _nameController.text.trim();

    await registerUser(
      context,
      name,
      phone,
      email,
      password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UpperPartLogin(text: 'Sign Up'),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                    onPressed: () => register(context),
                    buttonLabel: 'Register',
                  ),
                  MaterialButton(
                    onPressed: () {
                      // Navigate to the Home Page when the button is pressed
                      Get.to(() => LoginPage());
                    },
                    child: const Text('Already have an account, Login',
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
