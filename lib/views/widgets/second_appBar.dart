import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/const.dart';
import 'package:souchi/views/pages/CartPage/cart_view.dart';

import '../pages/ProfilePage/profile_screen.dart';


class SecondAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SecondAppBar({super.key, required this.streamBranch, required this.branchName, required this.branchId});

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHight);
  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: const Color(0xffF2F2F2),
        automaticallyImplyLeading: false,
        elevation:0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child:  CircleAvatar(
                backgroundColor: Colors.white,
                
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),const SizedBox(width: 20,),
            Expanded(
              child: SizedBox( height: 40 ,width:40 ,
                child: Image.asset(
                  'assets/image/SplashLogo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children:  [
                  Padding(
                    padding:const EdgeInsets.only(right: 10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child:  IconButton(
                        onPressed: () {
                         Get.to(()=>CartScreen(streamBranch: streamBranch, branchName: branchName, branchId: branchId));
                        },
                        icon:const  Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon:const  Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Get.to(()=>ProfileScreen(streamBranch: streamBranch,branchName: branchName,branchId: branchId,));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
