import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/core/view_model/product_Controller.dart';

import '../../const.dart';

class CustomProdctItem extends StatefulWidget {
   CustomProdctItem({Key? key, this.isActive=true, required this.productObj, required this.idb, this.id, this.idInt}) : super(key: key);
   final bool isActive;
   final QueryDocumentSnapshot productObj;
   final id;
   final idInt;
   final int idb;
     int index=1;

  @override
  State<CustomProdctItem> createState() => _CustomProdctItemState();
}

class _CustomProdctItemState extends State<CustomProdctItem> {
   var pcontroller= Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return widget.isActive
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  // Photo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(



                      'assets/image/downloadItem.jpg',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //Product Name
                  Text(
                    widget.productObj.get('productname'),
                    style: const TextStyle(fontSize: 18, fontFamily: kfontPop),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // PRICE Egp
                  Text(widget.productObj.get('price')+'L.E',
                      style:
                          const TextStyle(fontFamily: kfontPop, fontSize: 16)),
                  const SizedBox(
                    height: 5,
                  ),
                  // Price Pts
                  Text.rich(
                    TextSpan(
                        text: '15  ',
                        style: const TextStyle(fontFamily: kfontPop),
                        children: [
                          TextSpan(
                            text: 'Pts',
                            style:const  TextStyle(color: kPrimaryColor),
                          ),
                        ]),
                  ),
                  // Bouns Pts
                  Text.rich(
                    TextSpan(
                        text: 'Bouns Pts  ',
                        style: const TextStyle(fontFamily: kfontPop),
                        children: [
                          TextSpan(
                            text: '+1',
                            style: const TextStyle(color: Colors.green),
                          ),
                        ]),
                  ),
                  // Catr Button
                  const SizedBox(
                    height: 5,
                  ),



                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xffF2F2F2)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: Colors.orange,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                            pcontroller.validatorBranch(widget.productObj, widget.idb);
                    },
                    child: const Text(
                      'ADD TO CART',
                      style: TextStyle(
                        fontFamily: kfontPop,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 40,
                    child: Row(
                      children: [
                        IconButton(onPressed: () {
                              setState(() {
                                widget.index++;
                                print(widget.index);
                              });
                              pcontroller.validatorBranch(widget.productObj, widget.idb);
                              GetSnackBar(title: 'ITEM ${widget.productObj.get('productname')} Added',
                              backgroundColor: Colors.green,);

                        }, icon: Icon(Icons.add)),
                        Text('${widget.index}'),

                        // deleteItem
                        IconButton(onPressed: () {
                          setState(() {
                            if(widget.index<0 || widget.index==0)
                              {  print(widget.index);

                              widget.index=0;

                              }else{
                              widget.index--;
                              print(widget.index);
                            }


                          });
                          pcontroller.ValidatorDeleteItem(widget.productObj.get('docId'), widget.idb);
                          GetSnackBar(title: 'ITEM ${widget.productObj.get('productname')} Removed',
                            backgroundColor: Colors.red,);


                        }, icon: Icon(Icons.remove)),

                    ],),
                  ),




                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    // Photo
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/image/downloadItem.jpg',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //Product Name
                    Text(
                      widget.productObj.get('productname'),
                      style:
                          const TextStyle(fontSize: 18, fontFamily: kfontPop),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // PRICE Egp
                    Text(widget.productObj.get('price')+'L.E',
                        style: const TextStyle(
                            fontFamily: kfontPop, fontSize: 16)),
                    const SizedBox(
                      height: 5,
                    ),
                    // Price Pts
                    Text.rich(
                      TextSpan(
                          text: '15  ',
                          style: const TextStyle(fontFamily: kfontPop),
                          children: [
                            TextSpan(
                              text: 'Pts',
                              style: const TextStyle(color: kPrimaryColor),
                            ),
                          ]),
                    ),
                    // Bouns Pts
                    Text.rich(
                      TextSpan(
                          text: 'Bouns Pts  ',
                          style: const TextStyle(fontFamily: kfontPop),
                          children: [
                            TextSpan(
                              text: '+1',
                              style: const TextStyle(color: Colors.green),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Catr Button
                    OutlinedButton(
                      onPressed:null,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: const Text(
                        'ADD TO CART',
                        style: TextStyle(fontFamily: kfontPop),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height:28,
                width: 78,
                decoration: const BoxDecoration(
                  color:kPrimaryColor,//Color(0xffEEEEEE)
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(8)),
                ),
                child: const Text('Sold Out ',
                    style: TextStyle(
                      color: Color(0xff27374D),
                      fontFamily: kfontPop,
                    ),
                    textAlign: TextAlign.center),
              ),
            ]),
          );
  }
}
