import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:souchi/views/pages/ProfilePage/components/name_widget.dart';
import 'package:souchi/views/widgets/location_widget.dart';

import '../../../../authentication/Core/functions.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final String branchName;
  // final Stream<QuerySnapshot> streamBranch;
  // final int branchId;

  const Body({super.key, required this.branchName, });
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
           NameWidget(),
          const SizedBox(height: 15,),
          const ProfilePic(),
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
            press: () {},
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
