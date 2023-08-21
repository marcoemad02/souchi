import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/login_screen.dart';

class SharedPreferencesManager {
  static Future<void> saveUserData(int points, String uid, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('points', points);
    prefs.setString('uid', uid);
    prefs.setString('name', name);
  }

  static Future<void> saveLoggedInStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn'); // Remove the 'isLoggedIn' key to log out the user
    prefs.remove('points');
    prefs.remove('uid');
    prefs.remove('name');
  }
// You can add more methods for other shared preferences operations
}
