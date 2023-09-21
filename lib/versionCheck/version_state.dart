import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:souchi/versionCheck/update_screen.dart';

class AppDataController {
  final CollectionReference _appDataCollection =
  FirebaseFirestore.instance.collection('versionState');

  Future<void> updateData(int intValue, String textValue) async {
    await _appDataCollection.doc('info').update({
      'state': intValue,
      'info': textValue,
    });
  }

  Future<String> getTextVariable() async {
    final documentSnapshot =
    await _appDataCollection.doc('info').get();
    if (documentSnapshot.exists) {
      return documentSnapshot.get('info');
    } else {
      return ''; // Handle case when document doesn't exist
    }
  }

  Future<int> getIntVariable() async {
    final documentSnapshot =
    await _appDataCollection.doc('info').get();
    if (documentSnapshot.exists) {
      return documentSnapshot.get('state');
    } else {
      return 0; // Handle case when document doesn't exist
    }
  }
  Future<bool> VersionState() async {
    int intVariable = await AppDataController().getIntVariable();
    if (intVariable == 1) {
      return true;
    } else {
      Get.to(updateScreen());
      return false;
    }
  }

}
// String infoText = await AppDataController().getTextVariable();

// class AppDataController {
//   final CollectionReference _appDataCollection =
//       FirebaseFirestore.instance.collection('version state');
//
//   Future<void> updateData(int intValue, String textValue) async {
//     await _appDataCollection.doc('version info').update({
//       'state': intValue,
//       'info': textValue,
//     });
//   }
//
//   Future<String> getVersionInfo() async {
//     final documentSnapshot = await _appDataCollection.doc('version info').get();
//     if (documentSnapshot.exists) {
//       return documentSnapshot.get('info');
//     } else {
//       return ''; // Handle the case when the document doesn't exist
//     }
//   }
//
//   Future<int> getIntVersionState() async {
//     final documentSnapshot = await _appDataCollection.doc('version info').get();
//     if (documentSnapshot.exists) {
//       return documentSnapshot.get('state');
//     } else {
//       return 0; // Handle the case when the document doesn't exist
//     }
//   }
// }
//
// Future<bool> VersionState() async {
//   AppDataController appDataController = AppDataController();
//   int intVariable = await appDataController.getIntVersionState();
//   if (intVariable == 1) {
//     return true;
//   } else {
//     Get.to(updateScreen());
//     return false;
//   }
// }

// AppDataController appDataController = AppDataController();
// await appDataController.updateData(1, 'New Text Value');
//
//
// AppDataController appDataController = AppDataController();
// String textValue = await appDataController.getTextVariable();
// print('Text Value: $textValue');
//
//
// AppDataController appDataController = AppDataController();
// int intValue = await appDataController.getIntVariable();
// print('Integer Value: $intValue');
//
//
// bool isValue1 = await checkAndPerformAction();
// if (isValue1) {
// // Perform the action when the integer value is 1
// print('Performing action for value 1');
// } else {
// // Perform the action when the integer value is not 1
// print('Performing action for value not 1');
// }
