import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../const.dart';


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
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 140,
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(8), bottomStart: Radius.circular(8)),
            child: CachedNetworkImage(
              width: screenWidth * 0.3, // Adjust the image width
              height: double.infinity,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) {
                return const SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return const CircularProgressIndicator(
                  color: Colors.red,
                );
              },
              imageUrl: cartObj.get('image'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name : ${cartObj.get('productname')}',
                  style: const TextStyle(
                    color: Color(0xffFF7517),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 5),
                Text(
                  'PRICE : ${cartObj.get('price')}',
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  'Quantity : ${Quantity ?? '45'}',
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
