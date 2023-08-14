import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pages/home_page.dart';

class BranchWidget extends StatelessWidget {
  const BranchWidget({
    Key? key,
    required this.streamBranch,
    required this.branchName,
    required String branchImage,
    required this.branchId,
    required this.streamBranchRaw,
    required this.streamBranchFried,
    required this.streamBranchSauces,
    required this.brachImage,
  }) : super(key: key);

  final Stream<QuerySnapshot> streamBranch;
  final Stream<QuerySnapshot> streamBranchRaw;
  final Stream<QuerySnapshot> streamBranchFried;
  final Stream<QuerySnapshot> streamBranchSauces;
  final String branchName;
  final String brachImage;
  final int branchId;
  // final Stream<QuerySnapshot> ptsRef;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        // Navigate to the desired page on tap
        Get.to(() => HomePage(
          productStream: streamBranch,
          branchName1: branchName,
          branchId: branchId,
          streamBranchFried: streamBranchFried,
          streamBranchRaw: streamBranchRaw,
          streamBranchSauces: streamBranchSauces,
          // ptsRef: ptsRef,
        )



        );
      },
      child: Column(
        children: [
          Container(

            child: Image.asset(brachImage), // Use Image.asset with the asset path
          ),
        ],
      ),
    );
  }
}
