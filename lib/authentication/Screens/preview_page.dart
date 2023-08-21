import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/authentication/Screens/register_screen.dart';
import 'package:souchi/const.dart';

import '../../styles.dart';
import '../widgets/custom_button.dart';

class PreviewPage extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'image': 'assets/image/upper_part.jpg',
      'name': 'Product 1',
      'ingredients': 'Ingredient 1, Ingredient 2',
      'otherData': 'Other Data 1',
    },
    {
      'image': 'assets/image/upper_part.jpg',
      'name': 'Product 2',
      'ingredients': 'Ingredient 3, Ingredient 4',
      'otherData': 'Other Data 2',
    },
    {
      'image': 'assets/image/upper_part.jpg',
      'name': 'Product 1',
      'ingredients': 'Ingredient 1, Ingredient 2',
      'otherData': 'Other Data 1',
    },
    {
      'image': 'assets/image/upper_part.jpg',
      'name': 'Product 2',
      'ingredients': 'Ingredient 3, Ingredient 4',
      'otherData': 'Other Data 2',
    },
    {
      'image': 'assets/image/upper_part.jpg',
      'name': 'Product 1',
      'ingredients': 'Ingredient 1, Ingredient 2',
      'otherData': 'Other Data 1',
    },
    {
      'image': 'assets/image/upper_part.jpg',
      'name': 'Product 2',
      'ingredients': 'Ingredient 3, Ingredient 4',
      'otherData': 'Other Data 2',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('So She Picks'),
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth / 2 - 16; // Adjust for margins

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth ~/ cardWidth,
              childAspectRatio:
                  cardWidth / (cardWidth + 140), // Adjust as needed
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Card(
                elevation: 4.0,
                margin: const EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(16.0), // Make the card rounded
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16.0)),
                      child: Image.asset(
                        item['image']!,
                        height: 100,
                        width: cardWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item['name']!,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ingredients: ${item['ingredients']!}',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Other Data: ${item['otherData']!}',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                    SizedBox(
                        height: 50,
                        child: CustomButton(
                          onPressed: () {
                            Get.defaultDialog(
                              buttonColor: kPrimaryColor,
                              cancelTextColor: kPrimaryColor,
                              titleStyle: Styles.textStyle30orange,
                              middleTextStyle: Styles.textStyle20,
                              contentPadding: const EdgeInsets.all(10),
                              barrierDismissible: true,
                              title: "Sign Up",
                              middleText: "you must Sign Up First",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                // Log out the user
                                Get.to(RegisterPage());
                              },
                              textConfirm: "Sign Up",
                              textCancel: "Cancel",
                              onCancel: () {},
                            );


                          },
                          buttonLabel: 'Try it Now',
                        ))
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
