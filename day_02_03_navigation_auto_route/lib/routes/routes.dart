import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route/transitions_builders.dart';
import 'package:day_02_03_navigation_auto_route/screens/first_screen.dart';
import 'package:day_02_03_navigation_auto_route/screens/home_screen.dart';
import 'package:day_02_03_navigation_auto_route/screens/secon_screen.dart';
import 'package:day_02_03_navigation_auto_route/screens/third_screen.dart';

// Use the [watch] flag to watch the files system for edits and rebuild as necessary.
// flutter packages pub run build_runner watch --delete-conflicting-outputs

// if you want the generator to run one time and exits use
// flutter packages pub run build_runner build --delete-conflicting-outputs

// Make sure you always Save your files before running the generator, if that doesn't work you can always try to clean and rebuild.
// flutter packages pub run build_runner clean

@autoRouter
class $Router {
  @initial
  HomeScreen homeScreen;

  //Normal
  FirstScreen firstScreen;

  //@MaterialRoute(fullscreenDialog: true)
  @CupertinoRoute(fullscreenDialog: true)
  SecondScreen secondScreen;

  @CustomRoute(
    transitionsBuilder: TransitionsBuilders.fadeIn,
    durationInMilliseconds: 200,
  )
  ThirdScreen thirdScreen;
}
