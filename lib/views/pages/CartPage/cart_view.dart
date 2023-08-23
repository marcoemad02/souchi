import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:souchi/views/widgets/second_appBar.dart';
import 'package:souchi/enums.dart';
import '../../../const.dart';
import '../../widgets/NavBar.dart';
import '../../widgets/checkout_buttom.dart';
import 'elements/body.dart'; // Import your other components

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
    required this.streamBranch,
    required this.branchName,
    required this.branchId,
  }) : super(key: key);

  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(
        streamBranch: streamBranch,
        branchId: branchId,
        branchName: branchName,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: streamBranch,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator(color: kPrimaryColor,)); // Loading indicator while waiting for data
          }

          return Column(
            children: [
              Expanded(
                child: Body(branchID: branchId),
              ),
              const SizedBox(height: 20),
                CustomCheckoutButton(branchId: branchId),
              SizedBox(height: 20,)
            ],
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.cart,
        streamBranch: streamBranch,
        branchId: branchId,
        branchName: branchName,
      ),
    );
  }
}