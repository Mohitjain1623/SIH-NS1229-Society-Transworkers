import 'package:shared_preferences/shared_preferences.dart';

class Constants{
  static setUserData(bool val, String number, String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', val);
    await prefs.setString('userNumber', number);
    await prefs.setString('username', username);
  }
}