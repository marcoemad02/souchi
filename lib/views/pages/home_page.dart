import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/styles.dart';
import 'package:souchi/views/widgets/app_bar.dart';
import 'package:souchi/views/widgets/category_icon.dart';
import 'package:souchi/views/widgets/location_widget.dart';
import 'package:souchi/views/widgets/popular_list.dart';

import '../../enums.dart';
import '../widgets/NavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[60],
      appBar: CustomAppBar(),



      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10,),
                LocationWidget(),
                SizedBox(height: 10,),
                Image.asset('assets/image/homeimage.jpg'),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'CATEGORY',
                        style: Styles.textStyle30orange
                        ),
                      ),

                  ],
                ),
                const SizedBox(height: 20),
                const Category(),
                const SizedBox(height: 20),
                const BesteSellerList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

    );
  }
}
