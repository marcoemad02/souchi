import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import 'offline_screen.dart';

Future checkNetworkConnectivity() async {
  final ConnectivityResult connectivityResult =
      await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    // User is online
    return true;
  } else {
    // User is offline
    Get.to(offlineScreen());
    // return false;
  }
}

// bool isOnline = await checkNetworkConnectivity();
// if (isOnline) {
// // Perform actions when online
// print('You are online!');
// } else {
// // Perform actions when offline
// print('You are offline. Please turn on the internet.');
// }
