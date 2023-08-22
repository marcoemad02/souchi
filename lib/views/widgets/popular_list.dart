import 'package:souchi/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  const BestSellerListViewItem({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(imagePath),
          const SizedBox(height: 10,),
          Text(
            title,
            style:Styles.textStyle30orange,
          ),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
              description ,
              style: TextStyle(fontSize: 18, fontFamily: kfontPop, color: Colors.black),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              backgroundColor: const Color(0xffFF7517),
            ),
            child: const Text(
              ' SHOP NOW ',
              style: TextStyle(fontFamily: 'poppins', fontSize: 18),
            ),
          ),
          const SizedBox(height: 14,)
        ],
      ),
    );
  }
}
//
// class BestSellerList extends StatelessWidget {
//   const BestSellerList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: BestSellerListViewItem(
//             title: 'Smoked Salmon',
//             description: 'This sushi recipe from All recipes is the simplest to make.',
//             imagePath: 'assets/image/homeimage.jpg',
//             onTap: () {
//               // Handle onTap action here
//             },
//           ),
//         );
//       },
//     );
//   }
// }
