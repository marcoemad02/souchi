import 'package:flutter/material.dart';

class CustomProdctItem extends StatelessWidget {
  const CustomProdctItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(



        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),


          color: Colors.white10
        ),
        child: Column(
          children: [
            Image.asset('assets/image/downloadItem.jpg'),
          ],
        ),
      ),
    );
  }
}

class ShopProductList extends StatelessWidget {
  const ShopProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(

      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 2,mainAxisExtent: 260),
      children: [
        CustomProdctItem(),
        CustomProdctItem(),
        CustomProdctItem(),
        CustomProdctItem(),
        CustomProdctItem(),
        CustomProdctItem(),
        CustomProdctItem(),
        CustomProdctItem(),
      ],
    );
  }
}
