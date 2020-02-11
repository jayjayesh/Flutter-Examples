import 'package:day_05_03_login_using_email/screens/home_page.dart';
import 'package:day_05_03_login_using_email/service/firebase_auth_service.dart';
import 'package:day_05_03_login_using_email/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static const String routName = 'RegisterPage';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  BuildContext _scaffoldContext;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double _nMaterialButtonMinWidth = 190.0;

  String _inputUserName, _inputEmail, _inputPassword;
  var _textfieldControllerUserName = TextEditingController();
  var _textfieldControllerEmail = TextEditingController();
  var _textfieldControllerPassword = TextEditingController();
  var _textfieldControllerReenterPassword = TextEditingController();
  final FocusNode _focusNodeUserName = FocusNode();
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
    var userNameFieldError =
        Constants.validateNameMethod(_textfieldControllerUserName.text);
    var emailFieldError =
        Constants.validateEmailMethod(_textfieldControllerEmail.text);
    var passwordFieldError =
        Constants.validatePasswordMethod(_textfieldControllerPassword.text);
    var reenterPasswordFieldError = Constants.validateReenterPasswordMethod(
        _textfieldControllerPassword.text,
        _textfieldControllerReenterPassword.text);

    if (userNameFieldError != null) {
      _showSnackBarWithText(text: userNameFieldError, fillColor: Colors.red);
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
    FirebaseAuthService firebaseAuthServiceProviderObjc =
        Provider.of<FirebaseAuthService>(context, listen: false);

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
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlutterLogo(size: 140),
                  SizedBox(height: Constants.heightBetweenWidgets),
                  TextFormField(
                    controller: _textfieldControllerUserName,
                    keyboardType: TextInputType.text,
                    focusNode: _focusNodeUserName,
                    validator: (typedText) =>
                        Constants.validateNameMethod(typedText),
                    onSaved: (typedText) => _inputUserName = typedText,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (term) {
                      _textfieldChangeFocus(
                          context, _focusNodeUserName, _focusNodeEmail);
                    },
                    decoration: Constants.inputDecorationUserName,
                  ),
                  SizedBox(
                    height: Constants.heightBetweenWidgets,
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
                    height: Constants.heightBetweenWidgets,
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
                    height: Constants.heightBetweenWidgets,
                  ),
                  MaterialButton(
                    height: 50,
                    color: Colors.blue,
                    minWidth: _nMaterialButtonMinWidth,
                    child: Text(
                      'Sign up',
                      style: Constants.textStyleLoginButton,
                    ),
                    onPressed: () async {
                      // if (_validateInputsFields()) {
                      //   print('proceed for signup');
                      // }

                      if (_formKey.currentState.validate()) {
                        print('save typedTextField text into string variables');
                        _formKey.currentState.save();
                        print('proceed for registration');
                        User newUser = await firebaseAuthServiceProviderObjc
                            .firebaseRegisterNewUserWith(
                          email: _inputEmail,
                          pass: _inputPassword,
                          username: _inputUserName,
                        );

                        if (newUser != null) {
                          HomePageArguments arg = HomePageArguments(
                              displayName: newUser.displayName,
                              emailId: newUser.email);

                          Navigator.pushNamed(context, HomePage.routName,
                              arguments: arg);
                        }
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
