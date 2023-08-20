import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../const.dart';

var maskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

void main() {
  var email = "fredrik@gmail.com";

  assert(EmailValidator.validate(email));
}

class EmailCustomTextFormField extends StatelessWidget {
  const EmailCustomTextFormField(this.hintText, this.labelText, this.controller,
      {Key? key})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextEditingController controller;

  // final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      offset: const Offset(0, 0),
      opacity: 0.18,
      sigma: 3,
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(22.0),
        child: TextFormField(
          controller: controller, // Set the controller for the TextFormField
          // onTap: onTap,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: const Icon(
              Icons.email,
              color: kPrimaryColor,
              // Set your desired color here
            ),
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            labelStyle: const TextStyle(
              color: Colors.orange,
            ),
            labelText: labelText,
            hintText: hintText,
            hoverColor: Colors.orange,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            contentPadding: const EdgeInsets.all(16.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordCustomTextFormField extends StatelessWidget {
  const PasswordCustomTextFormField(
      this.hintText, this.labelText, this.controller,
      {Key? key})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextEditingController controller;

  // final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      offset: const Offset(0, 0),
      opacity: 0.18,
      sigma: 3,
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(22.0),
        child: TextFormField(
          controller: controller, // Set the controller for the TextFormField
          // onTap: onTap,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: const Icon(
              Icons.password,
              color: kPrimaryColor,
            ),
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            labelStyle: const TextStyle(
              color: Colors.orange,
            ),
            labelText: labelText,
            hintText: hintText,
            hoverColor: Colors.orange,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            contentPadding: const EdgeInsets.all(16.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
        ),
      ),
    );
  }
}

class NameCustomTextFormField extends StatelessWidget {
  NameCustomTextFormField({
    required this.hintText,
    required this.labelText,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      offset: const Offset(0, 0),
      opacity: 0.18,
      sigma: 3,
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(22.0),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: const Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            // Use a person icon for name input
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            labelStyle: const TextStyle(
              color: Colors.orange,
            ),
            labelText: labelText,
            hintText: hintText,
            hoverColor: Colors.orange,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            contentPadding: const EdgeInsets.all(16.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneNumberCustomTextField extends StatelessWidget {
  const PhoneNumberCustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
  });

  final String hintText;
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      offset: const Offset(0, 0),
      opacity: 0.18,
      sigma: 3,
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(22.0),
        child: TextField(
          controller: controller, // Set the controller for the TextField
          keyboardType: TextInputType.phone,
          // inputFormatters: [maskFormatter], // Add phone number formatter
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: const Icon(
              Icons.phone,
              color: kPrimaryColor,
            ),
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            labelStyle: const TextStyle(
              color: Colors.orange,
            ),
            labelText: labelText,
            hintText: hintText,
            hoverColor: Colors.orange,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            contentPadding: const EdgeInsets.all(16.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
        ),
      ),
    );
  }
}
