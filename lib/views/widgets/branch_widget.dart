import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pages/home_page.dart';

class BranchWidget extends StatelessWidget {
  const BranchWidget({Key? key, required this.streamBranch, required this.branchName, required this.branchId,}) : super(key: key);

  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {

        Get.to(()=> HomePage(productStream: streamBranch,   branchName1:branchName, branchId: branchId ,));
      },
      child:Container(

        height: 115,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.orange,
            width: 2,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: SvgPicture.asset(
                  "assets/icons/Location point.svg",
                 color: Colors.orange,
                ),
              ),
              SizedBox(width: 6,),
              Container(
                child: Text(
                  branchName,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}