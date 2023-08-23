import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:souchi/styles.dart';

import '../const.dart';
import 'Card.dart';
// Import your other screens and dependencies

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

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: kPrimaryColor,
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'So She Picks',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Eat Suchi Get Points Eat more Suchi For Free🍣 ',
              style: Styles.textStyle30Blold,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Map<String, String>>>(
              stream: getDataStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];
                    return ProductCard(
                        item: item); // Use the ProductCard widget
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
