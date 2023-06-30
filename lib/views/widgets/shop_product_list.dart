import 'package:flutter/material.dart';
import 'package:souchi/const.dart';
import 'package:souchi/views/widgets/custom_product_Item.dart';



class ShopProductList extends StatelessWidget {
  const ShopProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
        left: 8,
      ),
      child: GridView(

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 5, mainAxisExtent: 350),
        children: [
          CustomProdctItem(isActive: true),
          CustomProdctItem(isActive: false),
          CustomProdctItem(isActive: true),
          CustomProdctItem(isActive: true),
          CustomProdctItem(isActive: false,),
          CustomProdctItem(isActive: true),
          CustomProdctItem(isActive: true),
          CustomProdctItem(isActive: false),
          CustomProdctItem(isActive: true),

        ],
      ),
    );
  }
}
