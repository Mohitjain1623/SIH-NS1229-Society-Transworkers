import 'package:shared_preferences/shared_preferences.dart';

class Constants{
  static setUserData(bool val, String number, String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', val);
    await prefs.setString('userNumber', number);
    await prefs.setString('username', username);
  }

  static setInterests(bool val, List<String> arr) async {
    final SharedPreferences prefsInterest = await SharedPreferences.getInstance();
    await prefsInterest.setBool('isInterested', val);
    await prefsInterest.setStringList("interest", arr);
  }

  static setLanguage(bool val, int langIndex) async {
    final SharedPreferences prefsInterest = await SharedPreferences.getInstance();
    await prefsInterest.setBool('isLangSelected', val);
    await prefsInterest.setInt("language", langIndex);
  }
}