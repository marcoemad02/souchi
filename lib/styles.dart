import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/const.dart';

abstract class Styles {
  static const textStyle30orange = TextStyle(
    fontSize: 30,
    color: Color(0xffFF7517),
    fontFamily: 'Poppins',
  );
  static const textStyle30Blold = TextStyle(
      fontSize: 30,
      color: kPrimaryColor,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);
  static const textStyle25orange = TextStyle(
      fontSize: 25,
      color: Color(0xffFF7517),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);
  static const textStyle20orange = TextStyle(
      fontSize: 20,
      color: Color(0xffFF7517),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
}

//const TextStyle textStyle = TextStyle();
