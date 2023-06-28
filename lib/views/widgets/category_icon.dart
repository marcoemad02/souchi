import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/const.dart';

class category extends StatelessWidget {
  const category({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/image/raw.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'RAW',
              style: TextStyle(
                color: Color(0xffFF7517),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/image/fried.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'FRIED',
              style: TextStyle(
                color: Color(0xffFF7517),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/image/sauces.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'SAUCES',
              style: TextStyle(
                color: Color(0xffFF7517),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
