import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/views/widgets/checkout_buttom.dart';

class Body extends StatelessWidget {
  final int branchID;

  const Body({Key? key, required this.branchID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: branchID == 1
          ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => ListView.builder(
              itemCount: controller.data55.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(controller.data55[index][0].id),
                  onDismissed: (direction) {
                    controller.removeItemAtIndex55(index);
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: CartItemWidget(
                    Quantity: controller.data55[index][1],
                    cartObj: controller.data55[index][0],
                    branchID: branchID,
                  ),
                );
              },
            ),
          ),
        ),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => ListView.builder(
              itemCount: controller.cartItemsMohandseen.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(controller.cartItemsMohandseen[index].id),
                  onDismissed: (direction) {
                    controller.removeItemAtIndexMohandseen(index);
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: CartItemWidget(
                    cartObj: controller.cartItemsMohandseen[index],
                    branchID: branchID,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  CartItemWidget({
    Key? key,
    required this.cartObj,
    required this.branchID,
    this.Quantity,
  }) : super(key: key);

  final QueryDocumentSnapshot cartObj;
  final int branchID;
  final dynamic Quantity;

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find<ProductController>();

    return Container(
      height: 180,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Text(
                  '  Name :${cartObj.get('productname')}',
                  style: const TextStyle(
                    color: Color(0xffFF7517),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 5,),
                    Text(
                      ' PRICE :${cartObj.get('price')}',
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(width: 80,),
                    Text('Quantity : ${Quantity ?? '45'}',style: TextStyle(fontSize: 24),)
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
