import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:souchi/core/view_model/product_Controller.dart';

import '../../const.dart';


class CustomProdctItem extends StatefulWidget {
  CustomProdctItem(
      {Key? key,
      this.isActive = true,
      required this.productObj,
      required this.idb,
      this.id,
      this.idInt, this.image})
      : super(key: key);
  final bool isActive;
  final QueryDocumentSnapshot productObj;
  final id;
  final idInt;
  final int idb;
  int index = 1;
  final image;

  @override
  State<CustomProdctItem> createState() => _CustomProdctItemState();
}

class _CustomProdctItemState extends State<CustomProdctItem> {
  var pcontroller = Get.put(ProductController());

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
                  Container(
                    height: 90,
                    child: ClipRRect(
                      borderRadius:  BorderRadius.circular(10),
                      child: CachedNetworkImage(
                       imageUrl: widget.image,
                        placeholder: (context, url) => CircularProgressIndicator(color: kPrimaryColor),
                        errorWidget: (context, url, error) => CircularProgressIndicator(color: kPrimaryColor,),
                      ),
                    ),
                  ),

                  // buildClipRRect(widget.image),
                  const SizedBox(
                    height: 5,
                  ),
                  //Product Name
                  Text(
                    widget.productObj.get('productname'),
                    style: const TextStyle(fontSize: 18, fontFamily: kfontPop),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // PRICE Egp
                  Text(widget.productObj.get('price') + 'L.E',
                      style:
                          const TextStyle(fontFamily: kfontPop, fontSize: 16)),
                  const SizedBox(
                    height: 5,
                  ),
                  // Price Pts
                  const Text.rich(
                    TextSpan(
                        text: '15  ',
                        style: TextStyle(fontFamily: kfontPop),
                        children: [
                          TextSpan(
                            text: 'Pts',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ]),
                  ),
                  // Bouns Pts
                  const Text.rich(
                    TextSpan(
                        text: 'Bouns Pts  ',
                        style: TextStyle(fontFamily: kfontPop),
                        children: [
                          TextSpan(
                            text: '+1',
                            style: TextStyle(color: Colors.green),
                          ),
                        ]),
                  ),
                  // Catr Button
                  const SizedBox(
                    height: 5,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center the content in the row
                      children: [
                        // Add icon button
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.index++;
                              print(widget.index);
                            });
                            //pcontroller.validatorBranch(widget.productObj, widget.idb);
                          },
                          icon: Icon(Icons.add),
                        ),
                        Text('${widget.index}'),

                        // Remove icon button
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (widget.index <= 1) {
                                print(widget.index);
                                widget.index = 1;
                              } else {
                                widget.index--;
                                print(widget.index);
                              }
                            });
                            // pcontroller.validatorDeleteItem(widget.productObj.get('docId'), widget.idb);
                          },
                          icon: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),





                  OutlinedButton(

                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xffF2F2F2)),
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
                      pcontroller.validatorBranch(
                          widget.productObj, widget.idb, widget.index);
                      Get.snackbar('!!!', 'Item Added To Cart',);
                      print('Index ${widget.index}');
                      print('Array :${pcontroller.CartItemsHosary}');
                      pcontroller.calculationTotalValidator(widget.idb);
                      pcontroller.IncrementPoints();
                    },
                    child: const Text(
                      'ADD TO CART',
                      style: TextStyle(
                        fontFamily: kfontPop,
                        color: Colors.black,
                      ),
                    ),
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
                      borderRadius:  BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: widget.image,
                        placeholder: (context, url) => CircularProgressIndicator(color: kPrimaryColor),
                        errorWidget: (context, url, error) => CircularProgressIndicator(color: kPrimaryColor,),
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
                    Text(widget.productObj.get('price') + 'L.E',
                        style: const TextStyle(
                            fontFamily: kfontPop, fontSize: 16)),
                    const SizedBox(
                      height: 5,
                    ),
                    // Price Pts
                    const Text.rich(
                      TextSpan(
                          text: '15  ',
                          style: TextStyle(fontFamily: kfontPop),
                          children: [
                            TextSpan(
                              text: 'Pts',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ]),
                    ),
                    // Bouns Pts
                    const Text.rich(
                      TextSpan(
                          text: 'Bouns Pts  ',
                          style: TextStyle(fontFamily: kfontPop),
                          children: [
                            TextSpan(
                              text: '+1',
                              style: TextStyle(color: Colors.green),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Catr Button
                    OutlinedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    ),

                    // Container(
                    //   height: 28,
                    //   width: 78,
                    //   decoration: const BoxDecoration(
                    //     color: Colors.grey, //Color(0xffEEEEEE)
                    //     borderRadius:
                    //     BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft:Radius.circular(8)),
                    //   ),
                    //   child: const Text('Sold Out ',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontFamily: kfontPop,
                    //         fontSize: 18,
                    //
                    //       ),
                    //       textAlign: TextAlign.center),
                    // ),

                  ],
                ),
              ),
              Container(
                height: 38,
                width: 78,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: kPrimaryColor, //Color(0xffEEEEEE)
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
