import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pages/home_page.dart';

class BranchWidget extends StatelessWidget {
  const BranchWidget({Key? key, required this.streamBranch, required this.branchName, required this.branchId}) : super(key: key);
  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        Get.to(()=>HomePage(productStream: streamBranch,   branchName1:branchName, branchId: branchId ,));
      },
      child: Container(
        height: 130,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.orange
        ),
        child: Center(child: Text(branchName,style: TextStyle(fontSize: 22),)),


      ),
    );
  }
}