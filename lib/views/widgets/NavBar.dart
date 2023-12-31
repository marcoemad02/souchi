import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/views/pages/BranchPage/branch_view.dart';
import 'package:souchi/views/pages/CartPage/cart_view.dart';
import 'package:souchi/views/pages/ProfilePage/profile_screen.dart';

import '../../const.dart';
import '../../enums.dart';
import '../pages/ProfilePage/Helpcenter_Screen.dart';

class CustomBottomNavBar extends StatelessWidget {
   CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
    required this.streamBranch,
    required this.branchName,
    required this.branchId,
  }) : super(key: key);

  final MenuState selectedMenu;
  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;
  double br=45;


  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(br),
          topRight: Radius.circular(br),
        //   bottomLeft: Radius.circular(br),
        //   bottomRight: Radius.circular(br),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: 20,
            spreadRadius: 10,
            color: const Color(0xFFDADADA).withOpacity(0.5),
          ),
        ],

      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Cart Icon.svg",
                  color: MenuState.cart == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Get.to(() => CartScreen(
                        branchName: branchName,
                        branchId: branchId,
                        streamBranch: streamBranch,
                      ));
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Location point.svg",
                  color: MenuState.location == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                color: MenuState.location == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                onPressed: () {
                  controller.validatorClear(branchId);
                  Get.to(() => const BranchScreen());
                },
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Call.svg",
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Get.to(() => HelpCenter());
                  }),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: MenuState.profile == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Get.to(() => ProfileScreen(
                          streamBranch: streamBranch,
                          branchName: branchName,
                          branchId: branchId,
                        ));
                  }),
            ],
          )),
    );
  }
}
