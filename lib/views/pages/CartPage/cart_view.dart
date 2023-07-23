import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/views/pages/CartPage/elements/body.dart';
import 'package:souchi/views/widgets/app_bar.dart';
import 'package:souchi/views/widgets/checkout_buttom.dart';
import 'package:souchi/views/widgets/location_widget.dart';
import 'package:souchi/views/widgets/second_appBar.dart';

import '../../../enums.dart';
import '../../widgets/NavBar.dart';

class CartScreen extends StatelessWidget {
const   CartScreen({super.key, required this.streamBranch, required this.branchName, required this.branchId});
  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(streamBranch:streamBranch,branchId: branchId,branchName: branchName, ),
      body: Column(
        children: [
          Expanded(child: Body(branchID: branchId, )),
          SizedBox(height: 20,),
          CustomCheckoutButton(branchId: branchId,),
          SizedBox(height: 20,),
        ],
      ) ,

      bottomNavigationBar:  CustomBottomNavBar(selectedMenu: MenuState.cart,streamBranch: streamBranch,branchId: branchId,branchName: branchName),
    );
  }
}
