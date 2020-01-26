import 'package:day_07_05_ui_simple_login_screen/utils/Constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  BuildContext _scaffoldContext;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double _nHeightBetweenWidgets = 15;
  double _nMaterialButtonMinWidth = 190.0;

  String _inputFirstName, _inputLastName, _inputEmail, _inputPassword;
  var _textfieldControllerFirstName = TextEditingController();
  var _textfieldControllerLastName = TextEditingController();
  var _textfieldControllerEmail = TextEditingController();
  var _textfieldControllerPassword = TextEditingController();
  var _textfieldControllerReenterPassword = TextEditingController();
  final FocusNode _focusNodeFirstName = FocusNode();
  final FocusNode _focusNodeLastName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeReenterPassword = FocusNode();

  _textfieldChangeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  _showSnackBarWithText({String text, Color fillColor}) {
    SnackBar snackBarr =
        SnackBar(content: Text(text), backgroundColor: fillColor);
    //_scaffoldKey.currentState.showSnackBar(snackBarr);
    Scaffold.of(_scaffoldContext).showSnackBar(snackBarr);
  }

  bool _validateInputsFields() {
    var firstNameFieldError =
        Constants.validateNameMethod(_textfieldControllerFirstName.text);
    var lastnameFieldError =
        Constants.validateNameMethod(_textfieldControllerLastName.text);
    var emailFieldError =
        Constants.validateEmailMethod(_textfieldControllerEmail.text);
    var passwordFieldError =
        Constants.validatePasswordMethod(_textfieldControllerPassword.text);
    var reenterPasswordFieldError = Constants.validateReenterPasswordMethod(
        _textfieldControllerPassword.text,
        _textfieldControllerReenterPassword.text);

    if (firstNameFieldError != null) {
      _showSnackBarWithText(text: firstNameFieldError, fillColor: Colors.red);
      return false;
    } else if (lastnameFieldError != null) {
      _showSnackBarWithText(text: lastnameFieldError, fillColor: Colors.red);
      return false;
    } else if (emailFieldError != null) {
      _showSnackBarWithText(text: emailFieldError, fillColor: Colors.red);
      return false;
    } else if (passwordFieldError != null) {
      _showSnackBarWithText(text: passwordFieldError, fillColor: Colors.red);
      return false;
    }
    // else if (reenterPasswordFieldError != null) {
    //   _showSnackBarWithText(
    //       text: reenterPasswordFieldError, fillColor: Colors.red);
    //   return false;
    // }
    else {
      print('Email & Password Saved : Go to Login screen');
      _focusNodeEmail.unfocus();
      _focusNodePassword.unfocus();
      _showSnackBarWithText(text: 'Signup success', fillColor: Colors.green);
      return true;
    }
  }

  //--------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Builder(
        builder: (BuildContext context) {
          _scaffoldContext = context;
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              //autovalidate: true, // realtime validate textField inputs as you type along
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(size: 140),
                  SizedBox(height: _nHeightBetweenWidgets),
                  TextFormField(
                    controller: _textfieldControllerFirstName,
                    keyboardType: TextInputType.text,
                    focusNode: _focusNodeFirstName,
                    validator: (typedText) =>
                        Constants.validateNameMethod(typedText),
                    onSaved: (typedText) => _inputFirstName = typedText,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (term) {
                      _textfieldChangeFocus(
                          context, _focusNodeFirstName, _focusNodeLastName);
                    },
                    decoration: Constants.inputDecorationFirstName,
                  ),
                  SizedBox(
                    height: _nHeightBetweenWidgets,
                  ),
                  TextFormField(
                    controller: _textfieldControllerLastName,
                    keyboardType: TextInputType.text,
                    focusNode: _focusNodeLastName,
                    validator: (typedText) =>
                        Constants.validateNameMethod(typedText),
                    onSaved: (typedText) => _inputLastName = typedText,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (term) {
                      _textfieldChangeFocus(
                          context, _focusNodeLastName, _focusNodeEmail);
                    },
                    decoration: Constants.inputDecorationLastName,
                  ),
                  SizedBox(
                    height: _nHeightBetweenWidgets,
                  ),
                  TextFormField(
                    controller: _textfieldControllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _focusNodeEmail,
                    validator: (typedText) =>
                        Constants.validateEmailMethod(typedText),
                    onSaved: (typedText) => _inputEmail = typedText,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (term) {
                      _textfieldChangeFocus(
                          context, _focusNodeEmail, _focusNodePassword);
                    },
                    decoration: Constants.inputDecorationEmail,
                  ),
                  SizedBox(
                    height: _nHeightBetweenWidgets,
                  ),
                  TextFormField(
                    controller: _textfieldControllerPassword,
                    focusNode: _focusNodePassword,
                    validator: (typedText) =>
                        Constants.validatePasswordMethod(typedText),
                    onSaved: (typedText) => _inputPassword = typedText,
                    //textInputAction: TextInputAction.next,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (term) {
                      // _textfieldChangeFocus(
                      //     context, _focusNodePassword, _focusNodeReenterPassword);
                      _focusNodePassword.unfocus();
                    },
                    obscureText: true,
                    decoration: Constants.inputDecorationPassword,
                  ),
                  SizedBox(
                    height: _nHeightBetweenWidgets,
                  ),
                  TextFormField(
                      //   controller: _textfieldControllerReenterPassword,
                      //   focusNode: _focusNodeReenterPassword,
                      //   textInputAction: TextInputAction.done,
                      //   validator: (typedText) => Constants.validateReenterPasswordMethod(_textfieldControllerPassword.text,typedText),
                      //   onFieldSubmitted: (term) {
                      //     _focusNodeReenterPassword.unfocus();
                      //   },
                      //   obscureText: true,
                      //   decoration: Constants.inputDecorationReenterPassword,
                      // ),
                      // SizedBox(
                      //   height: _nHeightBetweenWidgets,
                      ),
                  MaterialButton(
                    height: 50,
                    color: Colors.blue,
                    minWidth: _nMaterialButtonMinWidth,
                    child: Text(
                      'Sign up',
                      style: Constants.textStyleLoginButton,
                    ),
                    onPressed: () {
                      // if (_validateInputsFields()) {
                      //   print('proceed for signup');
                      // }

                      if (_formKey.currentState.validate()) {
                        print('save typedTextField text into string variables');
                        _formKey.currentState.save();
                        print('proceed for login');
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
