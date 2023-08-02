import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String iconSvgPath;
  final TextEditingController controller;
  final bool obscureText;
  final String errorMessage;

  CustomTextFormField({
    required this.labelText,
    required this.iconSvgPath,
    required this.controller,
    this.obscureText = false,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
      }
    });

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? Colors.orange : Colors.orange,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            iconSvgPath,
            width: 18,
            height: 18,
            color: focusNode.hasFocus ? Colors.grey : Colors.orange,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: focusNode.hasFocus ? Colors.orange : Colors.orange,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: Colors.orange,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }
}





class YourWidget extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          labelText: 'Enter your email',
          iconSvgPath: 'assets/your_email_icon.svg',
          controller: _emailController,
          errorMessage: 'Please enter a valid email address',
        ),

        SizedBox(width: double.infinity, height: 20),

        CustomTextFormField(
          labelText: 'Enter your password',
          iconSvgPath: 'assets/your_password_icon.svg',
          controller: _passwordController,
          obscureText: true,
          errorMessage: 'Please enter a valid password',
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: YourWidget(),
      ),
    ),
  ));
}
