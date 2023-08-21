import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/styles.dart';
import 'package:souchi/views/pages/ProfilePage/Helpcenter_Screen.dart';
import 'package:souchi/views/pages/ProfilePage/components/name_widget.dart';
import 'package:souchi/views/widgets/location_widget.dart';

import '../../../../authentication/Core/Shared_pref.dart';
import '../../../../authentication/Screens/change_user_password_page.dart';
import '../../../../authentication/Screens/login_screen.dart';
import '../../../../const.dart';
import 'profile_menu.dart';

class Body extends StatelessWidget {
  final String branchName;

  // final Stream<QuerySnapshot> streamBranch;
  // final int branchId;

  const Body({
    super.key,
    required this.branchName,
  });

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const NameWidget(),
          const SizedBox(
            height: 15,
          ),
          // const ProfilePic(),

          //
          const SizedBox(height: 15),
          LocationWidget(branchName: branchName),
          const ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            // press: () => Get.to(() => const ChangeUserData()),
          ),
          ProfileMenu(
              text: "Change my password ",
              icon: 'assets/icons/Lock.svg',
              press: () => Get.to(
                    () => ChangePasswordScreen(),
                  )),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Get.to(() =>  HelpCenter());
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              // Show a confirmation dialog
              Get.defaultDialog(
                buttonColor: kPrimaryColor,
                cancelTextColor: kPrimaryColor,
                 titleStyle: Styles.textStyle30orange,
                 middleTextStyle: Styles.textStyle20,
                contentPadding: EdgeInsets.all(10),
                barrierDismissible: true,
                title: "Log Out",
                middleText: "Are you sure you want to log out?",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  // Log out the user
                  SharedPreferencesManager.logOut();
                  Get.offAll(LoginPage());
                },
                textConfirm: "Log Out",
                textCancel: "Cancel",
                onCancel: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
