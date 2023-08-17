import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souchi/splash_view/persentation/splash_view.dart';
import 'package:souchi/views/pages/BranchPage/branch_view.dart';

import 'authentication/Screens/login_screen.dart';
import 'firebase_options.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const souchi());
// }
//
// class souchi extends StatelessWidget {
//   const souchi({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light().copyWith(
//         scaffoldBackgroundColor: const Color(0xffF6F1F1),
//       ), // Background for all screens
//       home: FutureBuilder(
//         future: _checkLoggedInStatus(),
//         builder: (context, AsyncSnapshot<bool> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const SplashView(); // Show a loading screen while checking login status
//           } else {
//             if (snapshot.data == true) {
//               return const BranchScreen(); // Navigate to BranchScreen if user is logged in
//             } else {
//               return LoginPage(); // Navigate to LoginPage if user is not logged in
//             }
//           }
//         },
//       ),
//     );
//   }
//
//   Future<bool> _checkLoggedInStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool('isLoggedIn') ?? false;
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const souchi());
}

class souchi extends StatelessWidget {
  const souchi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,

      // home:SplashView(),
      // getPages: appRoutes,
      home: BranchScreen(),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor:
              const Color(0xffF6F1F1)), //background for all screens
    );
  }
}
