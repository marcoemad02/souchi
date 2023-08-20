import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../enums.dart';
import '../../widgets/NavBar.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(
      {super.key,
      required this.streamBranch,
      required this.branchName,
      required this.branchId});

  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;

  //static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF7517),
        title: const Text(
          "MY PROFILE ",
          style: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
      body: Body(
        branchName: branchName,
      ),
      bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.profile,
          branchId: branchId,
          streamBranch: streamBranch,
          branchName: branchName),
    );
  }
}
