import 'package:souchi/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child:
    Column(
      children: [
        Image.asset('assets/image/homeimage.jpg'),
        const SizedBox(height: 10,),
        const Text('Smoked Salmon',style: TextStyle(fontSize:28,fontFamily: kfontPop,color: Colors.black),),
        const Text('This sushi recipe from Allrecipes is the simplest ',style: TextStyle(fontSize:18,fontFamily: kfontPop,color: Colors.black),)
      ],
    )
    );
  }
}

class BesteSellerList extends StatelessWidget {
  const BesteSellerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 1,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(),
        );
      },
    );
  }
}
