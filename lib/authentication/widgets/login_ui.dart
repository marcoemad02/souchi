import 'package:flutter/material.dart';

import '../../const.dart';

class UpperPartLogin extends StatelessWidget {
  final String text;

  const UpperPartLogin({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80.0),
              bottomRight: Radius.circular(0.0),
            ),
            image: DecorationImage(
              image: AssetImage('assets/image/login_pic.jpg'),
              fit: BoxFit.cover, // Adjust this as per your requirement
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 20,
            ),
            // Adjust the value as per your requirement
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 40,
                color: Color(0xffFF7517),
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
