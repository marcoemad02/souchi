import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/core/view_model/product_Controller.dart';

import '../pages/CartPage/cart_view.dart';
import 'Buttom_sheet.dart';



class CustomCheckoutButton extends StatelessWidget {
  final  controller=Get.put(ProductController());
  final int branchId;


   CustomCheckoutButton({super.key, required this.branchId});

  get onClosing => null;
  get builder => null;


  @override
  Widget build(BuildContext context) {
   //String Tex='';
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: ( ) {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return BottomSheetContent(branchId: branchId,);
            },
          );



          print('added');

          // Implement your checkout logic here
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const  Text(
              'Total Price :',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.grey,

              ),
            ),
            const SizedBox(width: 8),
            GetBuilder(
              init: ProductController(),
              builder: (controller) {
                return Text(
                  '\$${controller.TotalPriceLE}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                    //fontWeight: FontWeight.bold,
                  ),
                );

              },
            ),
            const SizedBox(width: 22),
            const  Text(
              'CHECKOUT',
              style: TextStyle(
                fontSize:21,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
