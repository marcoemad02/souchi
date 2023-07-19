import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/styles.dart';
import 'package:souchi/views/widgets/app_bar.dart';
import 'package:souchi/views/widgets/category_icon.dart';
import 'package:souchi/views/widgets/location_widget.dart';
import 'package:souchi/views/widgets/popular_list.dart';

import '../../enums.dart';
import '../widgets/NavBar.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key, required this.productStream, required this.branchName1, required this.branchId});
  var controllerr = Get.put(ProductController());
  final Stream<QuerySnapshot> productStream;
  final String branchName1;
  final int branchId;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[60],
      appBar: CustomAppBar(branchId: branchId,branchName: branchName1,streamBranch: productStream),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 10,),
                LocationWidget(branchName: branchName1),
                const SizedBox(height: 10,),
                Image.asset('assets/image/homeimage.jpg'),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'CATEGORY',
                        style: Styles.textStyle30orange
                        ),
                      ),

                  ],
                ),
                const SizedBox(height: 20),
                 Category(productStream:  productStream,branchId: branchId,branchName1: branchName1),
                const SizedBox(height: 20),
                 const BesteSellerList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,branchId: branchId,branchName: branchName1,streamBranch:  FirebaseFirestore.instance.collection('activee').snapshots(),),
    );
  }
}
