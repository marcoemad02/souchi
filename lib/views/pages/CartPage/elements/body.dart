
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/views/widgets/checkout_buttom.dart';

class Body extends StatelessWidget {

  final int branchID;


  const Body({super.key, required this.branchID, });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: branchID ==1 ? Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder:(controller) => ListView.builder(
              itemCount: controller.cartItemsHosary.length,
              itemBuilder: (context, index) {
                return cartItemWidget(cartObj: controller.cartItemsHosary[index],branchID: branchID,);

              },
            ),
          ),
        ),
      ): Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder:(controller) => ListView.builder(
              itemCount: controller.cartItemsMohandseen.length,
              itemBuilder: (context, index) {
                return cartItemWidget(cartObj: controller.cartItemsMohandseen[index],branchID: branchID,);

              },
            ),
          ),
        ),
      ),
    );
  }
}

class cartItemWidget extends StatelessWidget {
  cartItemWidget({
    super.key, required this.cartObj,required this.branchID
  });
  final QueryDocumentSnapshot cartObj;
   int branchID;
  var controller=Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,

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
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
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
                    const Text(' PRICE : ',style: TextStyle(color: Colors.black45,fontFamily: 'Poppins',fontSize: 18),),
                    const SizedBox(width: 5,),
                    Text(
                      ' Price :${cartObj.get('price')}' ,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
            const SizedBox(height: 10,),
            Container(

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),),
                  child:Row(

                    children: [
                      const SizedBox(width: 6,),
                      IconButton(icon: const Icon(Icons.remove,),onPressed: () {
                         controller.ValidatorDeleteItem(cartObj.id,branchID);
                      },),
                      Text('  2  ', style: TextStyle(fontSize: 18),),
                      const Icon(Icons.add_outlined),
                      const SizedBox(width: 6,),
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
