
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/splash_view/persentation/splash_view.dart';
import 'package:souchi/views/pages/BranchPage/branch_view.dart';
import 'package:souchi/views/pages/home_page.dart';
import 'core/app_routes.dart';
import 'firebase_options.dart';

void main() async{
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
      initialRoute:'/',
       //home:SplashView(),
      // getPages: appRoutes,
      home: const BranchScreen(),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0xffF6F1F1)), //background for all screens
    );
  }
}
