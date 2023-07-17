import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/views/pages/CartPage/cart_view.dart';
import 'package:souchi/views/pages/ProfilePage/profile_screen.dart';
import 'package:souchi/views/pages/home_page.dart';
import '../../const.dart';
import '../../enums.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color:  MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () { Get.to(HomePage());}

              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Cart Icon.svg",
                  color: MenuState.cart == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),

                onPressed: () {Get.to(CartScreen());},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Location point.svg",
                  color: MenuState.location == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                color: MenuState.location == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: (){Get.to(ProfileScreen());}
              ),
            ],
          )),
    );
  }
}
