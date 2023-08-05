import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/const.dart';
import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/views/widgets/checkout_buttom.dart';

class Body extends StatelessWidget {
  final int branchID;

  const Body({Key? key, required this.branchID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPadding(branchID)
    );
  }

  Widget buildPadding(branchId) {
    if(branchId==1){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: GetBuilder<ProductController>(
          init: ProductController(),
          builder: (controller) => ListView.builder(
            itemCount: controller.CartItemsHosary.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key:UniqueKey() ,
                //Key(controller.CartItemsHosary[index][0].id),
                onDismissed: (direction) {
                  controller.removeItemAtIndexHosary(index,controller.CartItemsHosary[index]);
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
                  Quantity: controller.CartItemsHosary[index][1],
                  cartObj: controller.CartItemsHosary[index][0],
                  branchID: branchID,
                ),
              );
            },
          ),
        ),
      ),
    );}
     if(branchId==2){
       return Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Container(
           child: GetBuilder<ProductController>(
             init: ProductController(),
             builder: (controller) => ListView.builder(
               itemCount: controller.CartItemsMohandseen.length,
               itemBuilder: (context, index) {
                 return Dismissible(
                   key: Key(controller.CartItemsMohandseen[index][0].id),
                   onDismissed: (direction) {
                     controller.removeItemAtIndexMohandseen(index,controller.CartItemsMohandseen[index]);
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
                     Quantity: controller.CartItemsMohandseen[index][1],
                     cartObj: controller.CartItemsMohandseen[index][0],
                     branchID: branchID,
                   ),
                 );
               },
             ),
           ),
         ),
       );
     }


     /// we want to modify It
     return const Center(child: Text('Erorr'));
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
      height: 140,
      width: double.infinity,
   margin:const  EdgeInsetsDirectional.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),


      ),
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.start,
        children: [

          ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(topStart:Radius.circular(8) ,bottomStart:Radius.circular(8) ),
              child:CachedNetworkImage(
                  height: double.infinity,
                  width: 110,
                  fit: BoxFit.fitHeight,
                  imageUrl: cartObj.get('image'),
                placeholder: (context, url) => const CircularProgressIndicator(color: kPrimaryColor,),
                errorWidget: (context, url, error) => const CircularProgressIndicator(color: kPrimaryColor),
              ),),
              
             // Image.asset('assets/image/downloadItem.jpg',fit: BoxFit.fitHeight,width: 110,height: double.infinity,)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Name : ${cartObj.get('productname')}',
                  style:const TextStyle(
                    color: Color(0xffFF7517),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    //overflow: TextOverflow.ellipsis,

                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,



                ),
                const SizedBox(width: 5,),
                Text(
                  'PRICE : ${cartObj.get('price')}',
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),

                Text('Quantity : ${Quantity ?? '45'}',style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),),
                const SizedBox(height: 10,),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
