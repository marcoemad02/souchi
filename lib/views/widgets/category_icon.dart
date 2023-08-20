import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/views/pages/elements/fried_category_page.dart';
import 'package:souchi/views/pages/elements/raw_category_page.dart';
import 'package:souchi/views/pages/elements/sauces_category_page.dart';

class Category extends StatelessWidget {
  Category(
      {super.key,
      required this.productStream,
      required this.branchName1,
      required this.branchId,
      required this.streamBranchRaw,
      required this.streamBranchFried,
      required this.streamBranchSauces});

  final Stream<QuerySnapshot> productStream;
  final String branchName1;
  final int branchId;
  final Stream<QuerySnapshot> streamBranchRaw;
  final Stream<QuerySnapshot> streamBranchFried;
  final Stream<QuerySnapshot> streamBranchSauces;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => RawCategoryPage(
                      streamBranch: productStream,
                      branchId: branchId,
                      branchName: branchName1,
                      streamBranchRaw: streamBranchRaw,
                    ));
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
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => FriedCategoryPage(
                      branchName: branchName1,
                      branchId: branchId,
                      streamBranch: productStream,
                      streamBranchFried: streamBranchFried,
                    ));
              },
              child: const CircleAvatar(
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
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => SaucesCategoryPage(
                      branchName: branchName1,
                      streamBranch: productStream,
                      branchId: branchId,
                      streamBranchSauces: streamBranchSauces,
                    ));
              },
              child: const CircleAvatar(
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
