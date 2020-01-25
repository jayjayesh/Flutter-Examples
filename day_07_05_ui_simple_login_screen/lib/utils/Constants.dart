import 'package:flutter/material.dart';

class Constants {
//==========TextStyle================
  static const TextStyle textStyleLoginButton =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

//==========InputDecoration================

  static const InputDecoration inputDecorationFirstName = InputDecoration(
      labelText: "First Name",
      //hintText: " ",
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder());

  static const InputDecoration inputDecorationLastName = InputDecoration(
      labelText: "Last Name",
      //hintText: " ",
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder());

  static const InputDecoration inputDecorationEmail = InputDecoration(
      labelText: "Email",
      //hintText: "lathiya@gmail.com",
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder());

  static const InputDecoration inputDecorationPassword = InputDecoration(
      labelText: "Password",
      //hintText: 'atleast 4 character'  //"madhubani@paintings1947",
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder());

  static const InputDecoration inputDecorationReenterPassword = InputDecoration(
      labelText: "Re-enter Password",
      //hintText: 'atleast 4 character'  //"madhubani@paintings1947",
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder());

//========== Validation ================
  static String validateNameMethod(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  static String validatePasswordMethod(String value) {
    if (value.length < 4)
      return 'Password must be more than 3 charater';
    else
      return null;
  }

  static String validateReenterPasswordMethod(String value1, String value2) {
    if (value1 != value2)
      return 'Re-enter password does not match!';
    else
      return null;
  }

  static String validateMobileMethod(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  static String validateEmailMethod(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
