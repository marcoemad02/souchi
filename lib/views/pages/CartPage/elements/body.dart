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
                return CartItemWidget(
                  Quantity: controller.data55[index][1],
                   cartObj: controller.data55[index][0],
                  branchID: branchID,
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
                return CartItemWidget(
                  cartObj: controller.cartItemsMohandseen[index],
                  branchID: branchID,
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
    required this.branchID, this.Quantity,
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
          // Container(
          //   height: 120,
          //   width: 80,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(20),
          //     child: Image.asset(
          //       images[index],
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
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
                    // const Text(
                    //   ' PRICE : ',
                    //   style: TextStyle(
                    //     color: Colors.black45,
                    //     fontFamily: 'Poppins',
                    //     fontSize: 18,
                    //   ),
                    // ),
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
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: Row(
                //     children: [
                //       IconButton(
                //         icon: const Icon(Icons.remove),
                //         onPressed: () {
                //           if (branchID == 1) {
                //             controller.removeItemFromCartHos(cartObj.get('docId'));
                //           } else {
                //             controller.removeItemFromCartMohandseen(cartObj.get('docId'));
                //           }
                //         },
                //       ),
                //       Text(
                //         '${controller.getItemQuantity(cartObj.get('docId'), branchID)}',
                //         style: TextStyle(fontSize: 18),
                //       ),
                //       IconButton(
                //         icon: const Icon(Icons.add_outlined),
                //         onPressed: () {
                //           if (branchID == 1) {
                //             controller.addItemToCartHos(cartObj,Quantity);
                //           } else {
                //             controller.addItemToCartMohandseen(cartObj);
                //           }
                //         },
                //       ),
                //     ],
                //   ),
                // ),
               const SizedBox(width: 20,),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
