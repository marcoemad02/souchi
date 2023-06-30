import 'package:flutter/material.dart';
import 'package:souchi/const.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: const Color(0xffF2F2F2),
        automaticallyImplyLeading: false,
        elevation:10,
        title: Row(
          children: [
             Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child:  CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
              print('to list page');
                  },
                  icon: const Icon(
                    Icons.list,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),const SizedBox(width: 20,),
            Expanded(
              child: SizedBox( height: 40 ,width:40 ,
                child: Image.asset(
                  'assets/image/SplashLogo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children:  [
                  Padding(
                    padding:const EdgeInsets.only(right: 10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child:  IconButton(
                        onPressed: () {
                          print('to cart page');
                        },
                        icon:const  Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon:const  Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        print('to profile page');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
