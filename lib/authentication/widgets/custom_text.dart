import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static TextStyle button = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    textStyle: const TextStyle(
      color: Colors.white,
      letterSpacing: 1,
      fontSize: 20,

    ),
  );
}

//
// Text(
// 'Custom Heading',
// style: CustomTextStyle.heading,
// ),
// Text(
// 'Custom Body Text',
// style: CustomTextStyle.body,
// ),
// TextButton(
// onPressed: () {},
// child: Text(
// 'Custom Button',
// style: CustomTextStyle.button,
// ),
