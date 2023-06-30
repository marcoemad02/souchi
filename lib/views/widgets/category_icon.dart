import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/const.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            // Raw
            GestureDetector(
              onTap: () {
               Get.toNamed('RawCategoryPage');
              },
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/image/raw.jpg'),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
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
          children:  [
            GestureDetector(
              onTap: () {
               Get.toNamed('FriedCategoryPage');
              },
              child:const  CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/image/fried.jpg'),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
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
          children:  [
            GestureDetector(
              onTap: () {
                Get.toNamed('SaucesCategoryPage');
              },
              child:const  CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/image/sauces.jpg'),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
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
