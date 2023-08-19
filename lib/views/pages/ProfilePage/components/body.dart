
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/views/pages/ProfilePage/Helpcenter_Screen.dart';
import 'package:souchi/views/pages/ProfilePage/components/name_widget.dart';
import 'package:souchi/views/widgets/location_widget.dart';

import '../../../../authentication/Core/functions.dart';
import 'profile_menu.dart';



class Body extends StatelessWidget {
  final String branchName;
  // final Stream<QuerySnapshot> streamBranch;
  // final int branchId;

  const  Body({super.key, required this.branchName, });
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding:const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
           NameWidget(),
          const SizedBox(height: 15,),
          // const ProfilePic(),

          //
          const SizedBox(height:15),
          LocationWidget(branchName:branchName ),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Get.to(()=>const HelpCenter());
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press:  () => logout(context),
          ),
        ],
      ),
    );
  }
}
