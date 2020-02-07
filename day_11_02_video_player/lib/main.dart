import 'package:day_11_02_video_player/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

// TODO : must have to do these changes
//—> videos can not play in iOS Simulator, you need real device

/*

For android : video player configuration

(STEP-1) : android/app/build.gradle
minSdkVersion 21    ( it might be = minSdkVersion 16 change it to 21)
 

(STEP-2) :add below line at : android/app/src/profile/AndroidManifest.xml
<uses-permission android:name="android.permission.INTERNET"/>



For iOS  : video player configuration
—> videos can not play in iOS Simulator, you need real device

(STEP-1) : add inside info.plist
 
<key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>

*/

//----------------------

/*

Google : search like this : ( video player in android ) ( video player in ios ) that tutorial contains streaming url link. 
Sample video url = http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4
Smaple video url = https://gist.github.com/jsturgis/3b19447b304616f18657


Default Video Player
iOS     = FLT VideoPlayer
android = Exoplayer2 


*/
