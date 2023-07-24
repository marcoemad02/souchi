import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/core/view_model/product_Controller.dart';



class CustomCheckoutButton extends StatelessWidget {
  var controller=Get.put(ProductController());
  final int branchId;

   CustomCheckoutButton({super.key, required this.branchId});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: ( ) async{
          await controller.validatorCart(branchId);
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
                if(branchId==1){
                 return Text(
                    '\$${controller.totalHosary}',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                      //fontWeight: FontWeight.bold,
                    ),
                  );
                }else{
                  return Text(
                    '\$${controller.totalMohandseen}',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                      //fontWeight: FontWeight.bold,
                    ),
                  );
                }

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