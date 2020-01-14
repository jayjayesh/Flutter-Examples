import 'package:shared_preferences/shared_preferences.dart';

const kThemeStatus = 'THEMESTATUS';

class AppSharedPrefrence {
  setDarkTheme(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(kThemeStatus, value);
  }

  Future<bool> getBoolIsDarkTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(kThemeStatus) ?? false;
  }
}
