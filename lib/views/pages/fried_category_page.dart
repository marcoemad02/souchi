import 'package:flutter/material.dart';
import 'package:souchi/views/widgets/app_bar.dart';
import 'package:souchi/views/widgets/product_list.dart';

class FriedCategoryPage extends StatelessWidget {
  const FriedCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[60],
      appBar: CustomAppBar(),
      body: ShopProductList(),
    );
  }
}
