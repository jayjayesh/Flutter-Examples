import 'package:day_07_05_ui_simple_login_screen/utils/Constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  BuildContext _scaffoldContext;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _nHeightBetweenWidgets = 15.0;
  double _nMaterialButtonMinWidth = 190.0;

  var _textfieldControllerEmail = TextEditingController();
  var _textfieldControllerPassword = TextEditingController();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

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
    var emailFieldError =
        Constants.validateEmailMethod(_textfieldControllerEmail.text);
    var passwordFieldError =
        Constants.validatePasswordMethod(_textfieldControllerPassword.text);

    if (emailFieldError != null) {
      _showSnackBarWithText(text: emailFieldError, fillColor: Colors.red);
      return false;
    } else if (passwordFieldError != null) {
      _showSnackBarWithText(text: passwordFieldError, fillColor: Colors.red);
      return false;
    } else {
      print('Email & Password correct : Go to Login screen');
      _focusNodeEmail.unfocus();
      _focusNodePassword.unfocus();
      _showSnackBarWithText(text: 'Login success', fillColor: Colors.green);
      return true;
    }
  }

//--------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: new Builder(builder: (BuildContext context) {
        _scaffoldContext = context;
        return SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: 140,
              ),
              SizedBox(
                height: _nHeightBetweenWidgets,
              ),
              TextFormField(
                controller: _textfieldControllerEmail,
                keyboardType: TextInputType.emailAddress,
                focusNode: _focusNodeEmail,
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
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (term) {
                  _focusNodePassword.unfocus();
                },
                obscureText: true,
                decoration: Constants.inputDecorationPassword,
              ),
              SizedBox(
                height: _nHeightBetweenWidgets,
              ),
              MaterialButton(
                height: 50,
                color: Colors.blue,
                minWidth: _nMaterialButtonMinWidth,
                child: Text(
                  'Login',
                  style: Constants.textStyleLoginButton,
                ),
                onPressed: () {
                  if (_validateInputsFields()) {
                    print('proceed for login');
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                color: Colors.red,
                height: 40,
                minWidth: _nMaterialButtonMinWidth,
                child: Text(
                  'Google',
                  style: Constants.textStyleLoginButton,
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 7,
              ),
              MaterialButton(
                color: Colors.blue[900],
                height: 40,
                minWidth: _nMaterialButtonMinWidth,
                child: Text(
                  'Facebook',
                  style: Constants.textStyleLoginButton,
                ),
                onPressed: () {},
              ),
            ],
          ),
        );
      }),
    );
  }
}
