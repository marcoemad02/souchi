import 'package:flutter/material.dart';
import 'package:souchi/styles.dart';

class offlineScreen extends StatelessWidget {
  const offlineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/offline_image.png', // Replace with your custom offline image
            //   width: 200,
            //   height: 200,
            //   fit: BoxFit.contain,
            // ),
            SizedBox(height: 20),
            Text(
              'Oops! You are offline',
              style:Styles.textStyle30orange,
            ),
            SizedBox(height: 10),
            Text(
              'Please check your internet connection and try again.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Handle the action to retry or navigate to settings
            //   },
            //   child: Text(
            //     'Retry',
            //     style: TextStyle(fontSize: 16),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
