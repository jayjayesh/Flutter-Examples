import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class User {
  const User({
    @required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
  });

  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;
}

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
    );
  }

  Future<User> isUserLoggedIn() async {
    FirebaseUser loggedInCurrentUser = await _firebaseAuth.currentUser();
    return _userFromFirebase(loggedInCurrentUser);
  }

  Future<User> firebaseLoginWith(
      {@required String email, @required String pass}) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser loggedinUser = result.user;
      return _userFromFirebase(loggedinUser);
    } catch (err) {
      //_showSnackBarWithText(text: err.message, fillColor: Colors.red);
      BotToast.showText(text: err.message, backgroundColor: Colors.red);
      return null;
    }
  }

  Future<User> firebaseRegisterNewUserWith({
    String username,
    String email,
    String pass,
  }) async {
    try {
      AuthResult _authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass);
      //(STEP-1):(Register Screen):To identify (fack email) firebase send email-varification using below line. user not able to login untill he/she varify email
      //_authResult.user.sendEmailVerification();
      //(STEP-2):(Login Screen):Check if email varyfy then&then navigate to home_screen
      //if(_authResult.user.isEmailVerified)
      //{
      // Navigate to Home Screen
      //}

      FirebaseUser newUser = _authResult.user;

      if (newUser != null) {
        UserUpdateInfo _info = UserUpdateInfo();
        _info.displayName = username;
        //Set it to newUser
        newUser.updateProfile(_info);
        return _userFromFirebase(newUser);
      } else {
        //_showSnackBarWithText(text: 'fail to register', fillColor: Colors.red);
        BotToast.showText(
            text: 'fail to register', backgroundColor: Colors.red);
        return null;
      }
    } catch (err) {
      //_showSnackBarWithText(text: err.message, fillColor: Colors.red);
      BotToast.showText(text: err.message, backgroundColor: Colors.red);
      return null;
    }
  }

  Future<bool> sighoutButtonClicked() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (err) {
      //throw Exception('fail to signout');
      BotToast.showText(text: err.message, backgroundColor: Colors.red);
      return false;
    }
  }
}
