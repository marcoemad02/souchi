import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'custom_product_Item.dart';

class FriedShopProductList extends StatelessWidget {
  FriedShopProductList({Key? key, required this.streamBranch, required this.branchName, required this.branchId}) : super(key: key);
  final Stream<QuerySnapshot> streamBranch;
  final String branchName;
  final int branchId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
        left: 8,
      ),
      child: StreamBuilder<QuerySnapshot>(
          stream: streamBranch,
          builder: (context, snapshot) {
            if(snapshot.hasError){
              print('error : ${snapshot.hasError}');
              return const Center(child: Text('There is an Error',style: TextStyle(
                  fontSize: 30
              ),));
            }
            if(snapshot.connectionState ==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(color: Colors.orange,));
            }
            final data =snapshot.requireData;
            print(data);
            return GridView.builder(
              itemCount: data.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 350

              ),
              itemBuilder: (context, index) {
                return CustomProdctItem(productObj: data.docs[index],id: data.docs[index]['docId'],isActive: data.docs[index]['active'],idb: branchId ,idInt: data.docs[index]['id'],image: data.docs[index]['image'],); // not real idb number

              },



            );
          }
      ),
    );
  }
}