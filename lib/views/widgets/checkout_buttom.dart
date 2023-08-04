import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/core/view_model/product_Controller.dart';

import '../pages/CartPage/cart_view.dart';
import 'Buttom_sheet.dart';



class CustomCheckoutButton extends StatelessWidget {
  var controller=Get.put(ProductController());
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
        onPressed: ( ) async{

         // BottomSheetContent(branchId: branchId,);
          // await showModalBottomSheet(context: context, builder: (context) {
          //   return Container(
          //     //: 160,
          //     child: Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(15.0),
          //           child: TextField(
          //             onSubmitted: (value) {
          //               Tex=value;
          //             },
          //             decoration: InputDecoration(border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(12)
          //             )),
          //             controller: TextEditingController(
          //               text: Tex
          //             ),
          //           ),
          //         ),
          //         ElevatedButton(onPressed: () async {
          //           await controller.validatorCart(branchId,Tex);
          //         // await  controller.TakeAddrees(branchId, Tex);
          //           print("3enwan ${Tex}");
          //           print("3enwan2 ${controller.AddressHosary}");
          //
          //         }, child: Text('Order'))
          //       ],
          //     ),);
          // },);
       //  await controller.validatorCart(branchId);
          print('added');
         // print(Tex);
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
            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetContent(branchId: branchId,);
                  },
                );





              },

              child: const  Text(
                'CHECKOUT',
                style: TextStyle(
                  fontSize:21,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
