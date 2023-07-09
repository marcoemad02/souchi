import 'package:flutter/material.dart';



import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  //static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF7517),
        title: const Text("MY PROFILE ", style: TextStyle(fontFamily: "Poppins",),),
      ),
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
