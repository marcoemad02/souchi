import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/views/pages/ProfilePage/components/profile_menu.dart';

import '../Core/Shared_pref.dart';
import 'change_user_email_page.dart';
import 'change_user_password_page.dart';

class ChangeUserData extends StatelessWidget {
  const ChangeUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            ProfileMenu(
                text: "Change my password ",
                icon: 'assets/icons/Lock.svg',
                press: () => Get.to(
                      () => ChangePasswordScreen(),)),
            ProfileMenu(
              text: "Change my email ",
              icon: "assets/icons/User.svg",
                press: () => Get.to(
                      () => ChangeEmailScreen(),)),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () => SharedPreferencesManager.logOut(),
            ),
          ],
        ),
      ),
    );
  }
}
