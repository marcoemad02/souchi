
import 'package:flutter/material.dart';
import 'core/app_routes.dart';

void main() {
  runApp(const souchi());
}

class souchi extends StatelessWidget {
  const souchi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,

      //home: SplashView(),
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:
          const Color(0xffF6F1F1)), //background for all screens
    );
  }
}
