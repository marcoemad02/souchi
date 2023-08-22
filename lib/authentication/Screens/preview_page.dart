import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/authentication/Screens/preview_dashborad.dart';
import 'package:souchi/authentication/Screens/register_screen.dart';
import 'package:souchi/const.dart';

import '../../styles.dart';
import '../widgets/custom_button.dart';

Stream<List<Map<String, String>>> getDataStream() {
  return FirebaseFirestore.instance.collection('products').snapshots().map(
    (querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return {
          'image': doc['image'] as String,
          'name': doc['name'] as String,
          'ingredients': doc['ingredients'] as String,
          'otherData': doc['otherData'] as String,
        };
      }).toList();
    },
  );
}

List<Map<String, String>> data = [];

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        // Adjust the height as needed
        actions: [
          IconButton(
            icon: const Icon(Icons.dashboard),
            onPressed: () {
              Get.to(DashboardScreen());
            },
          ),
        ],
        backgroundColor: kPrimaryColor,
        title: const Padding(
          padding: EdgeInsets.only(top: 10), // Adjust top padding as needed
          child: Text(
            'So She Picks',
            style: TextStyle(fontSize: 20), // Adjust font size as needed
          ),
        ),
        // automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<List<Map<String, String>>>(
        stream: getDataStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];

                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16.0)),
                        child: Image.network(
                          item['image']!,
                          height: 100, // Adjusted
                          width: double.infinity, // Expand to full width
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset(
                              'assets/image/place_holder.jpg',
                              // Replace with your placeholder image path
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.fitHeight,
                            );
                          },
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
                          item['ingredients']!,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item['otherData']!,
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
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              },
            ),
          )
          ;
        },
      ),
    );
  }
}
