import 'package:day_07_15_ui_theme_light_dark/app_shared_prefrence.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  AppSharedPrefrence appPref = AppSharedPrefrence();
  //Tips
  //Provider concept : create_private_property, getter, setter

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    appPref.setDarkTheme(value);
    notifyListeners();
  }
}
