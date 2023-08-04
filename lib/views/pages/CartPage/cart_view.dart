import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/views/pages/CartPage/elements/body.dart';

import 'package:souchi/views/widgets/checkout_buttom.dart';

import 'package:souchi/views/widgets/second_appBar.dart';

import '../../../enums.dart';
import '../../widgets/NavBar.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key, required this.streamBranch, required this.branchName, required this.branchId});
  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;
  final controller=Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(streamBranch:streamBranch,branchId: branchId,branchName: branchName, ),
      body: Column(
        children: [
          Expanded(child: Body(branchID: branchId, )),
          const SizedBox(height: 20,),
          // Container(
          //   child: ElevatedButton(
          //     child:Text('Calculate') ,
          //     onPressed:() {
          //       print('YAd :${controller.data55}');
          //       controller.TestCalc();
          //     },
          //   ),
          // ),
          CustomCheckoutButton(branchId: branchId,),
          const SizedBox(height: 20,),
        ],
      ) ,

      bottomNavigationBar:  CustomBottomNavBar(selectedMenu: MenuState.cart,streamBranch: streamBranch,branchId: branchId,branchName: branchName),
    );
  }
}
