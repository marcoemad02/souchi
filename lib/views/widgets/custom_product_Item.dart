import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../const.dart';

class CustomProdctItem extends StatelessWidget {
   CustomProdctItem({Key? key, this.isActive=true}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
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
                    'Raw Salmon with lemon and pepperdjasnldakkndljn smakdasknj',
                    style: const TextStyle(fontSize: 18, fontFamily: kfontPop),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // PRICE Egp
                  Text('200 L.E',
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
                      print('mina');
                    },
                    child: const Text(
                      'ADD TO CART',
                      style: TextStyle(
                        fontFamily: kfontPop,
                        color: Colors.black,
                      ),
                    ),
                  )




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
                      'Raw Salmon with lemon and pepperdjasnldakkndljn smakdasknj',
                      style:
                          const TextStyle(fontSize: 18, fontFamily: kfontPop),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // PRICE Egp
                    Text('200 L.E',
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
                      onPressed: null,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
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
                  color: kPrimaryColor,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(8)),
                ),
                child: const Text(' Sold Out',
                    style: TextStyle(
                      fontFamily: kfontPop,
                    ),
                    textAlign: TextAlign.center),
              ),
            ]),
          );
  }
}
