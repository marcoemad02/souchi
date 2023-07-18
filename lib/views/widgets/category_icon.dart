import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/const.dart';
import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/views/pages/elements/fried_category_page.dart';
import 'package:souchi/views/pages/elements/raw_category_page.dart';
import 'package:souchi/views/pages/elements/sauces_category_page.dart';

class Category extends StatelessWidget {
   Category({super.key, required this.productStream, required this.branchName1, required this.branchId});
  var controllerr = Get.put(ProductController(),);
  final Stream<QuerySnapshot> productStream;
  final String branchName1;
  final int branchId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
               Get.to(()=> RawCategoryPage(streamBranch: productStream,branchId: branchId, branchName: branchName1,));
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
                Get.to( ()=>FriedCategoryPage(branchName: branchName1,branchId: branchId,streamBranch: productStream,));
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
               Get.to( ()=>SaucesCategoryPage(branchName: branchName1,streamBranch: productStream,branchId: branchId,));
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
