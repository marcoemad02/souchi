import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/const.dart';

import '../authentication/Screens/register_screen.dart';
import '../authentication/widgets/custom_button.dart';
import '../styles.dart';

class ProductCard extends StatelessWidget {
  final Map<String, String> item;

  const ProductCard({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
            child: Image.network(
              item['image']!,
              fit: BoxFit.cover,
              height: 140,
              width: double.infinity,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset(
                  'assets/image/place_holder.jpg',
                  fit: BoxFit.fitHeight,
                  height: 70,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                maxWidth: double.infinity,
              ),
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
                    item['name']!,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    item['ingredients']!,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      item['otherData']!,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(), // Use SizedBox to take up remaining space
          ),
          SizedBox(
            height: 50,
            child: CustomButton(
              onPressed: _showSignUpDialog,
              buttonLabel: 'Try it Now',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void _showSignUpDialog() {
    Get.defaultDialog(
      buttonColor: kPrimaryColor,
      cancelTextColor: kPrimaryColor,
      titleStyle: Styles.textStyle30orange,
      middleTextStyle: Styles.textStyle20,
      contentPadding: const EdgeInsets.all(10),
      barrierDismissible: true,
      title: "Sign Up",
      middleText: "You must Sign Up First",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.to(RegisterPage());
      },
      textConfirm: "Sign Up",
      textCancel: "Cancel",
      onCancel: () {},
    );
  }
}
