import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/views/pages/CartPage/elements/body.dart';
import 'package:souchi/views/widgets/app_bar.dart';
import 'package:souchi/views/widgets/location_widget.dart';

import '../../../enums.dart';
import '../../widgets/NavBar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body:

      Body() ,
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.cart),

    );
  }
}
