import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String _kLanguageCode = "language";
  static final String _kCounter = "counterKey";

//==============================================================

/*

A Future allows you to run work asynchronously 
to free up any other threads that should not be blocked. Like the UI thread


Define a Future : 
(1)( void myMethod{} ) you can use (Future) instead of (void)
(2)If you want to return a value from the Future then you pass it (a type)

Future myVoidFutureMethod() {}
Future<bool> myTypedFutureMethod() { return true; }

USE a Future : 
(1) use ( .then )
(2) use (async & await)

myTypedFutureMethod().then( (value) {
    // Run the code here using the value
    _selected = value;
  });

void getMethod() async {
   _selected = await myTypedFutureMethod();
}

*/

//==============================================================

  static Future<String> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kLanguageCode) ?? 'en';
  }

  static Future<bool> setLanguageCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kLanguageCode, value);
  }

//==============================================================

  static Future<int> getCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_kCounter) ?? 0;
  }

  static Future<bool> setCounter(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt(_kCounter, value);
  }

//==============================================================

}
