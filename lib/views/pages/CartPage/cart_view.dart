import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:souchi/views/widgets/second_appBar.dart';
import 'package:souchi/enums.dart';
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
            return const CircularProgressIndicator(); // Loading indicator while waiting for data
          }

          bool isCartEmpty = snapshot.data?.docs.isEmpty ?? true;

          return Column(
            children: [
              Expanded(
                child: Body(branchID: branchId),
              ),
              const SizedBox(height: 20),
              if (!isCartEmpty)
                CustomCheckoutButton(branchId: branchId),
              if (isCartEmpty)
                const IfCartEmptyWidget(), // Show if cart is empty
              const SizedBox(height: 20),
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

class IfCartEmptyWidget extends StatelessWidget {
  const IfCartEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('The  Cart  Is  Empty', style:
        TextStyle(
            fontSize: 22,
            fontFamily: 'poppins',
          color: Color(0xffFF7517)
        )),
      ],
    );
  }
}
