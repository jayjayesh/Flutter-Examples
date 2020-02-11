import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:day_05_03_login_using_email/screens/home_page.dart';
import 'package:day_05_03_login_using_email/screens/register_page.dart';
import 'package:day_05_03_login_using_email/service/firebase_auth_service.dart';
import 'package:day_05_03_login_using_email/utils/connection_singleton.dart';
import 'package:day_05_03_login_using_email/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routName = 'LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext _scaffoldContext;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  double _nMaterialButtonMinWidth = 190.0;

  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  String _inputEmail, _inputPassword;
  var _textfieldControllerEmail = TextEditingController();
  var _textfieldControllerPassword = TextEditingController();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  @override
  initState() {
    super.initState();

    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _connectionChangeStream.cancel();
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
    _showConnectionStatusToUser();
  }

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

  _showConnectionStatusToUser() {
    if (isOffline == true) {
      BotToast.showText(text: "Not connected", contentColor: Colors.red);
    } else {
      BotToast.showText(text: "connected", contentColor: Colors.green);
    }
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
    FirebaseAuthService firebaseAuthServiceProviderObjc =
        Provider.of<FirebaseAuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: new Builder(builder: (BuildContext context) {
        _scaffoldContext = context;
        return SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            //autovalidate:true, // realtime validate textField inputs as you type along
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlutterLogo(
                  size: 140,
                ),
                SizedBox(
                  height: Constants.heightBetweenWidgets,
                ),
                TextFormField(
                  controller: _textfieldControllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _focusNodeEmail,
                  validator: (typedText) =>
                      Constants.validateEmailMethod(typedText.trim()),
                  onSaved: (typedText) => _inputEmail = typedText.trim(),
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
                      Constants.validatePasswordMethod(typedText.trim()),
                  onSaved: (typedText) => _inputPassword = typedText.trim(),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (term) {
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
                    'Login',
                    style: Constants.textStyleLoginButton,
                  ),
                  onPressed: () async {
                    // if (_validateInputsFields()) {
                    //   print('proceed for login');
                    // }

                    if (_formKey.currentState.validate()) {
                      print('save textField text to your string variable');
                      _formKey.currentState.save();
                      print('proceed for login');
                      if (isOffline == true) {
                        _showConnectionStatusToUser();
                        return;
                      }
                      BotToast.showLoading();
                      User loggedInUser = await firebaseAuthServiceProviderObjc
                          .firebaseLoginWith(
                              email: _inputEmail, pass: _inputPassword);
                      BotToast.closeAllLoading();
                      if (loggedInUser != null) {
                        HomePageArguments arg = HomePageArguments(
                            displayName: loggedInUser.displayName,
                            emailId: loggedInUser.email);

                        // Navigator.pushNamed(context, HomePage.routName,
                        //     arguments: arg);

                        _textfieldControllerEmail.text = '';
                        _textfieldControllerPassword.text = '';
                        Navigator.pushReplacementNamed(
                            context, HomePage.routName,
                            arguments: arg);
                      }
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
          ),
        );
      }),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: FlatButton(
          color: Colors.transparent,
          child: Text("Click here to Sign Up"),
          onPressed: () {
            Navigator.pushNamed(context, RegisterPage.routName);
          },
        ),
      ),
    );
  }
}
