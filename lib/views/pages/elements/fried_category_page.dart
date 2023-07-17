import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/styles.dart';
import 'package:souchi/views/widgets/app_bar.dart';
import 'package:souchi/views/widgets/second_appBar.dart';

import '../../widgets/shop_product_list.dart';

class FriedCategoryPage extends StatelessWidget {
   FriedCategoryPage({super.key, required this.streamBranch, required this.branchName, required this.branchId});
  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SecondAppBar(branchName: branchName,branchId: branchId,streamBranch: streamBranch),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: const [
                  Text('FRIED SOUSHI',
                    style: Styles.textStyle30orange,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: ShopProductList(branchName: branchName,branchId: branchId,streamBranch: streamBranch,)),

          ],

        ),

      ),
    );
  }
}
