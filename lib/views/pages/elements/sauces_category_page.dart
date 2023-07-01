import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/styles.dart';
import 'package:souchi/views/widgets/app_bar.dart';
import 'package:souchi/views/widgets/second_appBar.dart';

import '../../widgets/shop_product_list.dart';

class SaucesCategoryPage extends StatelessWidget {
  const SaucesCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SecondAppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: const [
                  Text('SAUCES SOUSHI',
                    style: Styles.textStyle30orange,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: ShopProductList()),

          ],

        ),

      ),
    );
  }
}
