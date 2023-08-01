import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/login_screen.dart';

void logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('isLoggedIn'); // Remove the 'isLoggedIn' key to log out the user

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}
