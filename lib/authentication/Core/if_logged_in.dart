import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginCheck extends StatelessWidget {
  final Widget loggedInWidget;
  final Widget loggedOutWidget;

  const LoginCheck({
    Key? key,
    required this.loggedInWidget,
    required this.loggedOutWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoggedInStatus(),
      initialData: false,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const SplashView(); // Show a loading screen while checking login status
        // } else {
          if (snapshot.data == true) {
            return loggedInWidget; // Return the widget if user is logged in
          } else {
            return loggedOutWidget; // Return the widget if user is not logged in
          }
        // }
      },
    );
  }

  Future<bool> _checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}


