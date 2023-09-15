import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/styles.dart';

import 'package:souchi/views/widgets/second_appBar.dart';

import '../../../enums.dart';
import '../../widgets/NavBar.dart';
import '../../widgets/Rawshop_product_list.dart';

class SaucesCategoryPage extends StatelessWidget {
  const SaucesCategoryPage({super.key, required this.streamBranch, required this.branchName, required this.branchId, required this.streamBranchSauces});
  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;
  //final Stream<QuerySnapshot> streamBranchRaw;
  //final Stream<QuerySnapshot> streamBranchFried;
  final Stream<QuerySnapshot> streamBranchSauces;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: SecondAppBar(streamBranch: streamBranch,branchName: branchName,branchId: branchId),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text('SAUCES SUSHI',
                    style: Styles.textStyle30orange,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: RawShopProductList(branchName: branchName,branchId: branchId,streamBranch: streamBranchSauces,)),

          ],

        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.location, streamBranch: streamBranch, branchName:branchName, branchId:branchId,),
      ),
    );
  }
}
