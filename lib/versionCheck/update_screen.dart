import 'package:flutter/material.dart';
import 'package:souchi/styles.dart';

class updateScreen extends StatelessWidget {
  const updateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: kPrimaryColor, automaticallyImplyLeading: false),
      body: Padding(
          padding:
              const EdgeInsets.only(top: 80, bottom: 40, right: 20, left: 20),
          // Add padding to the entire column
          child: Column(
            children: [
              SizedBox(height: 20),
              // Add some spacing between the image and text
              Text(
                "We Are Out of Service, Try again later",
                style: Styles.textStyle30Blold,
              ),
            ],
          )),
    );
  }
}

// class updateScreen extends StatefulWidget {
//   updateScreen({Key? key}) : super(key: key);
//
//   @override
//   _UpdateScreenState createState() => _UpdateScreenState();
// }
//
// class _UpdateScreenState extends State<updateScreen> {
//   String infoText = ''; // Initialize infoText as an empty string
//
//   @override
//   void initState() {
//     super.initState();
//     // Fetch the infoText asynchronously when the widget is initialized
//     fetchInfoText();
//   }
//
//   Future<void> fetchInfoText() async {
//     try {
//       // Fetch the infoText from the AppDataController
//       String fetchedInfoText = await AppDataController().getTextVariable();
//       setState(() {
//         // Update the state with the fetched infoText
//         infoText = fetchedInfoText;
//       });
//     } catch (e) {
//       // Handle any errors that may occur when fetching the infoText
//       print('Error fetching infoText: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //     backgroundColor: kPrimaryColor, automaticallyImplyLeading: false),
//       body: Padding(
//           padding:
//               const EdgeInsets.only(top: 80, bottom: 40, right: 20, left: 20),
//           // Add padding to the entire column
//           child: Column(
//             children: [
//               // Image.asset(
//               //   'assets/image/SplashLogo.png',
//               //   // Replace with the actual image path
//               //   height: 70, // Adjust the height as needed
//               // ),
//
//               SizedBox(height: 20),
//               // Add some spacing between the image and text
//               Text(
//                 "We Are OUt of Service, Try again later",
//                 style: Styles.textStyle30Blold,
//               ),
//               // SizedBox(
//               //   height: 50,
//               // ),
//               // CustomButton(
//               //   onPressed: () async {
//               //     try {
//               //       if (await canLaunch(infoText)) {
//               //         await launch(infoText);
//               //       } else {
//               //         // Handle the case where the URL cannot be launched/ffffffff
//               //         showDialog(
//               //           context: context,
//               //           builder: (context) {
//               //             return AlertDialog(
//               //               title: Text("Error"),
//               //               content: Text("Unable to launch the URL."),
//               //               actions: [
//               //                 TextButton(
//               //                   onPressed: () {
//               //                     Navigator.of(context)
//               //                         .pop(); // Close the dialog
//               //                   },
//               //                   child: Text("OK"),
//               //                 ),
//               //               ],
//               //             );
//               //           },
//               //         );
//               //       }
//               //     } catch (e) {
//               //       // Handle any exceptions that may occur during launching
//               //       print('Error launching URL: $e');
//               //     }
//               //   },
//               //   buttonLabel: 'Update',
//               // )
//             ],
//           )),
//     );
//   }
// }
