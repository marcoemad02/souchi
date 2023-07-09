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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal:50),
          child: Text('This sushi recipe from All recipes is the simplest  to make ',style: TextStyle(fontSize:18,fontFamily: kfontPop,color: Colors.black),),
        ),
        const SizedBox(height: 20,),
        ElevatedButton(
          onPressed: () {},

          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40), // Adjust the radius as needed
            ),
            backgroundColor: const Color(0xffFF7517),


          ),
          child:
          const Text(' SHOP NOW ',style: TextStyle(fontFamily: kfontPop,fontSize: 18),),
        )

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
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(),
        );
      },
    );
  }
}
